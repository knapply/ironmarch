#' Build Message Network
#'
#' @examples
#' im_message_network()
#' @importFrom data.table copy setDT setnames
#' @export
im_message_network <- function() {
  if (!requireNamespace("igraph", quietly = TRUE)) {
    stop("{igraph} is required")
  }

  message_cols_to_drop <- c(
    "msg_post_key"
  )

  messages <- setDT(copy(combo_messages_df))[, (message_cols_to_drop) := NULL]

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
  ][, msg_date := as.double(msg_date)]

  member_cols_to_drop <- c(
    "member_login_key_expire", "joined", "last_activity", "last_visit"
  )

  # styler: off
  nodes_members <- setDT(
    copy(combo_members_df)
  )[, (member_cols_to_drop) := NULL]
  # styler: on
  setnames(nodes_members, old = "name", new = "screen_name")

  igraph::graph_from_data_frame(
    edges_member_member[
      source_msg_author_id %in% nodes_members$member_id &
        target_msg_author_id %in% nodes_members$member_id
    ],
    directed = FALSE,
    vertices = nodes_members
  )
}
