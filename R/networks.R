#' Build Message Network
#' 
#' @examples
#' im_message_g <- im_message_network()
#'
#' print(im_message_g, full = FALSE)
#' 
#' @importFrom data.table copy setDT setnames
#' @export
im_message_network <- function() {
  if (!requireNamespace("igraph", quietly = TRUE)) {
    stop("{igraph} is required")
  }

  message_cols_to_drop <- c(
    "msg_post_key"
  )

  messages <- build_messages(as_tibble = FALSE)[, (message_cols_to_drop) := NULL]

  edges_init <- unique(
    # styler: off
    messages[
      , .(source_msg_author_id = msg_author_id,
          target_msg_author_id = msg_author_id,
          msg_topic_id, msg_id)
      ][, expand.grid(source_msg_author_id = source_msg_author_id,
                      target_msg_author_id = target_msg_author_id),
        by = msg_topic_id
        ][source_msg_author_id != target_msg_author_id
          ]
  )[, .(source_msg_author_id, target_msg_author_id, msg_topic_id)
    ]
  # styler: on

  edges_member_member <- edges_init[
    messages,
    on = "msg_topic_id", nomatch = 0, all = TRUE
  ]

  member_cols_to_drop <- c(
    "member_login_key_expire", "last_activity", "last_visit"
  )

  # styler: off
  nodes_members <- build_members(as_tibble = FALSE
                                 )[, (member_cols_to_drop) := NULL
                                   ][order(member_id)]
  # styler: on
  setnames(nodes_members, old = "name", new = "screen_name")
  el <- as.matrix(edges_member_member[
    source_msg_author_id %in% nodes_members$member_id &
      target_msg_author_id %in% nodes_members$member_id, 1:2
  ])

  el <- apply(el, 2, as.character)

  edge_attrs <- edges_member_member[
    source_msg_author_id %in% nodes_members$member_id &
      target_msg_author_id %in% nodes_members$member_id
  ]

  g <- igraph::graph_from_edgelist(
    el,
    directed = FALSE
  )
  igraph::edge_attr(g) <- as.list(edge_attrs)
  igraph::vertex_attr(g) <- as.list(nodes_members[member_id %in% el[, 1]])
  igraph::vertex_attr(g, "name") <- sprintf("m%d", 
                                            igraph::vertex_attr(g, "member_id"))
  g
}



im_geodist_matrix <- function() {
  stopifnot(
    "{sf} not installed" = requireNamespace("sf", quietly = TRUE),
    "{dplyr} not installed" = requireNamespace("dplyr", quietly = TRUE),
    "{units} not installed" = requireNamespace("units", quietly = TRUE)
  )
  
  nodes_to_keep <- igraph::vertex_attr(
    im_message_network(), "member_id"
  )
  
  messages <- build_messages(as_tibble = FALSE)
  members <- build_members(
    as_tibble = FALSE
    )[member_id %in% nodes_to_keep
      ][order(member_id)
        ]

  geocoded_messages <- unique(
    merge(
      messages[, .(msg_author_id, msg_ip_address, msg_topic_id)],
      .all_geocoded_ips_df[, .(msg_ip_address = ip_address, lon, lat)],
      by = "msg_ip_address"
    )[, !"msg_ip_address"]
  )

  member_centroids <- sf::st_as_sf(geocoded_messages,
    coords = c("lon", "lat"), crs = 4326L
  )
  member_centroids <- sf::st_transform(member_centroids, crs = 3857L)
  member_centroids <- dplyr::group_by(member_centroids, msg_author_id)
  member_centroids <- dplyr::summarise(member_centroids)
  member_centroids <- suppressWarnings(
    sf::st_centroid(member_centroids)
  )

  matrix_coords <- setDT(
    expand.grid(
      data.table(
        source_member_id = members$member_id,
        target_member_id = members$member_id
      )
    )
  )[source_member_id != target_member_id]

  dyad_points <- merge(
    merge(
      matrix_coords,
      member_centroids,
      by.x  = "source_member_id",
      by.y = "msg_author_id"
    ),
    member_centroids,
    by.x = "target_member_id",
    by.y = "msg_author_id"
  )

  dyad_multipoints <- mapply(
    c,
    dyad_points$geometry.x,
    dyad_points$geometry.y,
    SIMPLIFY = FALSE,
    USE.NAMES = FALSE
  )

  dyad_df <- data.table(
    source_member_id = dyad_points$source_member_id,
    target_member_id = dyad_points$target_member_id,
    geometry = sf::st_as_sfc(
      dyad_multipoints, crs = sf::st_crs(member_centroids)
    )
  )[, distance_km := as.double(
    units::set_units(
      sf::st_length(sf::st_cast(geometry, "LINESTRING")),
      "km"
    )
  )][, geometry := NULL
     ][order(source_member_id, target_member_id)
       ][, source_member_id := paste0("m", source_member_id)
         ][, target_member_id := paste0("m", target_member_id)
           ][]
  
  dim_names <- paste0("m", members$member_id)
  
  out <- matrix(0, nrow = nrow(members), ncol = nrow(members),
                dimnames = list(dim_names, dim_names))
  for (i in seq_len(nrow(dyad_df))) {
    out[dyad_df$source_member_id[[i]], 
        dyad_df$target_member_id[[i]]] <- dyad_df$distance_km[[i]]
  }
  
  out
}

im_same_member_group_id_mat <- function() {
  stopifnot(
    "{sf} not installed" = requireNamespace("sf", quietly = TRUE),
    "{dplyr} not installed" = requireNamespace("dplyr", quietly = TRUE),
    "{units} not installed" = requireNamespace("units", quietly = TRUE)
  )
  
  nodes_to_keep <- igraph::vertex_attr(
    im_message_network(), "member_id"
  )
  
  messages <- build_messages(as_tibble = FALSE)
  members <- build_members(
    as_tibble = FALSE
    )[member_id %in% nodes_to_keep
      ][order(member_id)
        ]

  matrix_coords <- setDT(
    expand.grid(
      data.table(
        source_member_id = members$member_id,
        target_member_id = members$member_id
      )
    )
  )
  
  
  dyads <- merge(
    merge(
      matrix_coords,
      members[, .(member_id, member_group_id)],
      by.x  = "source_member_id",
      by.y = "member_id"
    ),
    members[, .(member_id, member_group_id)],
    by.x = "target_member_id",
    by.y = "member_id"
  )[, same_group := as.integer(member_group_id.x == member_group_id.y)
    ][, member_group_id.x := NULL
      ][, member_group_id.y := NULL
        ][, source_member_id := paste0("m", source_member_id)
          ][, target_member_id := paste0("m", target_member_id)
            ]
  
  dim_names <- paste0("m", members$member_id)
  
  out <- matrix(NA, nrow = nrow(members), ncol = nrow(members),
                dimnames = list(dim_names, dim_names))
  for (i in seq_len(nrow(matrix_coords))) {
    out[dyads$source_member_id[[i]], 
        dyads$target_member_id[[i]]] <- dyads$same_group[[i]]
  }
  
  out
}


.get_year <- function(x) as.POSIXlt(x, tz = "UTC")$year + 1900
.as_dttm <- function(x) as.POSIXct(x, origin = "1970-01-01")

.split_graph_by_year <- function(g, drop_isolates = FALSE) {
  dates <- .as_dttm(igraph::edge_attr(g, "msg_date"))
  years <- .get_year(dates)
  
  splits <- sort(unique(years))
  names(splits) <- paste0("y", splits)
  
  lapply(splits, function(.x) {
    igraph::subgraph.edges(
      graph = g,
      eids = which(
        .get_year(
          .as_dttm(igraph::edge_attr(g, "msg_date"))
        ) == .x
      ),
      delete.vertices = drop_isolates
    )
  })
}

# @return 3d array, with each element in the third dimension containing
# the adjacency matrix for a given year
.as_adj_cube <- function(g) {
  adj_mats <- lapply(
    .split_graph_by_year(g),
    igraph::as_adjacency_matrix,
    sparse = FALSE
  )
  
  for (nm in names(adj_mats)) {
    adj_mats[[nm]][adj_mats[[nm]] != 0] <- 1
    year <- as.integer(substring(nm, 2L))
    inactive_nodes <- igraph::vertex_attr(
      g, "name",
      index = which(
        .get_year(igraph::vertex_attr(g, "joined")) > year
      )
    )
    adj_mats[[nm]][inactive_nodes, ] <- 10
    adj_mats[[nm]][, inactive_nodes] <- 10
  }
  
  out <- array(
    unlist(adj_mats, use.names = FALSE),
    dim = c(dim(adj_mats[[1L]]), length(adj_mats)),
    dimnames = list(
      rownames(adj_mats[[1L]]),
      colnames(adj_mats[[1L]]),
      names(adj_mats)
    )
  )
  
  out
}


.im_adacency_cube <- function() {
  stopifnot(
    "{igraph} not installed" = requireNamespace("igraph", quietly = TRUE)
  )
  g <- im_message_network()
  
  .as_adj_cube(g)
}



