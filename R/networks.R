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
    "member_login_key_expire", "joined", "last_activity", "last_visit"
  )

  # styler: off
  nodes_members <- build_members(as_tibble = FALSE
                                 )[, (member_cols_to_drop) := NULL]
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
  g
}



im_geodist_matrix <- function() {
  stopifnot(
    "{sf} not installed" = requireNamespace("sf", quietly = TRUE),
    "{dplyr} not installed" = requireNamespace("dplyr", quietly = TRUE),
    "{units} not installed" = requireNamespace("units", quietly = TRUE)
  )
  
  messages <- build_messages(as_tibble = FALSE)
  members <- build_members(as_tibble = FALSE)

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
