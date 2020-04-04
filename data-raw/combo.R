assignInNamespace("print.data.table", function(x, ...) print(tibble::as_tibble(x), ...), ns = "data.table")

library(data.table)
print.data.table <- function(x) print(tibble::as_tibble(x))
print.data.frame <- function(x) print(tibble::as_tibble(x))

orig_msgs <- copy(ironmarch::im_orig_dfs$orig_message_posts)
core_msgs <- copy(ironmarch::im_core_dfs$core_message_posts)


setnames(
  orig_msgs, 
  old = c("msg_post", "msg_author_id", "msg_post_key"),
  new = c("orig_msg_post", "orig_msg_author_id", "orig_msg_post_key")
)
setnames(
  core_msgs, 
  old = c("msg_post", "msg_author_id", "msg_post_key"), 
  new = c("core_msg_post", "core_msg_author_id", "core_msg_post_key")
)

combo_messages_df <- merge(
  orig_msgs, core_msgs, 
  all = TRUE,
  by = c("msg_id", "msg_topic_id", "msg_date",
         "msg_ip_address", "msg_is_first_post")
)

stopifnot(nrow(combo_messages_df) == 22309)

setDT(combo_messages_df)

combo_messages_df[
  , msg_post := fifelse(is.na(core_msg_post), orig_msg_post, core_msg_post)
  ][, msg_author_id := fifelse(is.na(core_msg_author_id), 
                               orig_msg_author_id, core_msg_author_id)
    ][, msg_post_key := fifelse(is.na(core_msg_post_key),
                                orig_msg_post_key, core_msg_post_key)
      ][, core_msg_post := NULL
        ][, orig_msg_post := NULL
          ][, core_msg_author_id := NULL
            ][, orig_msg_author_id := NULL
              ][, core_msg_post_key := NULL
                ][, orig_msg_post_key := NULL
                  ]

stopifnot(nrow(combo_messages_df[is.na(msg_author_id)]) == 0L)
stopifnot(nrow(combo_messages_df[is.na(msg_post)]) == 0L)

combo_messages_df <- tibble::as_tibble(combo_messages_df)

usethis::use_data(combo_messages_df, overwrite = TRUE)

target_cols <- c(
  "member_id", "name", "member_group_id", "email", "joined", 
  "ip_address", "skin", "warn_level", "warn_lastwarn", "bday_day", 
  "bday_month", "bday_year", "msg_count_new", "msg_count_total", 
  "msg_show_notification", "last_visit", "last_activity", "auto_track", 
  "mgroup_others", "member_login_key_expire", "members_seo_name", 
  "members_cache", "members_disable_pm", "failed_logins", "members_profile_views"
)

im_orig_dfs_orig_members <- setDT(copy(ironmarch::im_orig_dfs$orig_members))

orig_members <- copy(im_orig_dfs_orig_members
                     )[, ..target_cols
                       ][, priority := 2L
                         ]
im_core_dfs_core_members <- setDT(copy(ironmarch::im_core_dfs$core_members))
core_members <- copy(im_core_dfs_core_members
                     )[, ..target_cols
                       ][, priority := 1L
                         ]

# target_cols <- setdiff(
#   intersect(names(orig_members), names(core_members)),
#   c("restrict_post", "msg_count_reset", "mod_posts",
#     "temp_ban", "members_pass_hash", "members_pass_salt",
#     "members_bitoptions", "members_day_posts", "notification_cnt")
# )


combo_members_df <- merge(
  orig_members, core_members, 
  all = TRUE, on = "member_id"
  )[order(priority)
    ][, lapply(.SD, `[[`, 1L), by = member_id
      ][, priority := NULL
        ][, failed_logins := lapply(failed_logins, function(.x) {
            if (is.na(.x)) {
              return(
                data.table(
                  address = NA_real_, 
                  time = as.POSIXct(NA_real_, origin = "1970-01-01")
                  )[-1])
            }
            
            .x <- jsonlite::parse_json(.x)  
          
            addresses <- names(.x)
            addresses[nchar(addresses) == 0L] <- NA_character_

            times <- vapply(.x, function(.y) {
              init <- unlist(.y, use.names = FALSE)
              if (length(init) != 1L) NA_real_ else init
            }, double(1L), USE.NAMES = FALSE)
            
            data.table(
              address = addresses,
              time = as.POSIXct(times, origin = "1970-01-01")
              )[!is.na(address)]
        })]

combo_members_df <- tibble::as_tibble(combo_members_df)

usethis::use_data(combo_members_df, overwrite = TRUE)

# edges <- unique(
#   combo_dms_df[
#     , .(source = msg_author_id, target = paste0("topic_", msg_topic_id),
#         time = as.double(msg_date), ip_address = msg_ip_address,
#         message = msg_post)
#     ][source %in% combo_members_df$member_id
#       ]
# )
# 
# edges[, .N, by = .(source, target)][order(-N)]
# 
# stopifnot(
#   all(combo_members_df$member_id) %in% edges$source &&
#     edges$source %in% all(combo_members_df$member_id)
# )
# 
# library(igraph)
# bip_g <- igraph::graph_from_data_frame(edges)
# vertex_attr(bip_g, "type") <- vertex_attr(bip_g, "name"
#                                           ) %chin% as.character(edges$source)
# 
# g <- igraph::bipartite_projection(bip_g, which = TRUE)
# 
# nodes <- copy(combo_members_df
#               )[, member_id := as.character(member_id)
#                 ][match(vertex_attr(g, "name"), member_id)
#                   ]
# vertex_attr(g) <- nodes
# g
# 
# edge_attr(g)


