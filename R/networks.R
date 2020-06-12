#' Build Message Network
#'
#' @param edge_geo_distance 
#' Whether to calculate dyadic geo-distances and add as an edge attribute
#' named `distance_km` (for distance in kilometers). Member points are 
#' calculated from the centroids of each individual's geocoded IP addresses.
#'
#' @examples
#' im_message_g <- im_message_network()
#'
#' print(im_message_g, full = FALSE)
#' 
#' @importFrom data.table copy setDT setnames
#' @export
im_message_network <- function(edge_geo_distance = FALSE) {
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

  if (edge_geo_distance) {
    stopifnot(
      requireNamespace("sf", quietly = TRUE) &&
        requireNamespace("dplyr", quietly = TRUE) &&
        requireNamespace("units", quietly = TRUE)
    )

    geocoded_messages <- unique(
      merge(
        messages[, .(msg_author_id, msg_ip_address, msg_topic_id)],
        .all_geocoded_ips_df[, .(msg_ip_address = ip_address, lon, lat)],
        by = "msg_ip_address"
      )[, !"msg_ip_address"]
    )

    sf <- sf::st_as_sf(
      geocoded_messages,
      coords = c("lon", "lat"),
      crs = 4326L
    )
    member_centroids <- suppressWarnings(
      sf::st_centroid(
        dplyr::summarise(
          dplyr::group_by(sf::st_transform(sf, 3857L), msg_author_id)
        )
      )
    )

    dyad_points <- merge(
      merge(edges_member_member[, .(source_msg_author_id, target_msg_author_id)],
        member_centroids,
        by.x  = "source_msg_author_id",
        by.y = "msg_author_id"
      ),
      member_centroids,
      by.x = "target_msg_author_id",
      by.y = "msg_author_id"
    )

    dyad_multipoints <- mapply(
      c,
      dyad_points$geometry.x,
      dyad_points$geometry.y,
      SIMPLIFY = FALSE,
      USE.NAMES = FALSE
    )

    dyad_sf <- sf::st_as_sf(
      sf::st_as_sfc(dyad_multipoints, crs = 3857L)
    )

    dyad_distances <- sf::st_length(
      sf::st_cast(
        dyad_sf,
        "LINESTRING"
      )
    )

    edges_member_member[
      , distance_km := as.integer(units::set_units(dyad_distances, "km"))
    ]
  }

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
