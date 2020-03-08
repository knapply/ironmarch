#' Reconcile and Merge Messages
#' 
#' `build_messages()` reconciles and merges the messages from 
#' `im_orig_dfs$orig_message_posts` and `im_core_dfs$core_message_posts`.
#' 
#' @template param-summarize
#' @template param-split
#' @template param-as_tibble
#' 
#' @template return-df
#' 
#' @template author-bk
#' 
#' @examples 
#' # messages summarized to single rows ==================================================
#' build_messages()
#' 
#' # all message observations ============================================================
#' build_messages(summarize = FALSE)
#' 
#' # all message observations split into a list of data frames ===========================
#' split_messages <- build_messages(summarize = FALSE, split = TRUE)
#' 
#' # first five messages that appear in both... ==========================================
#' # ... `im_orig_dfs$orig_message_posts` and `im_core_dfs$core_message_posts`
#' split_messages[
#'   vapply(split_messages, function(.x) nrow(.x) == 2, logical(1L))
#' ][1:5]
#'
#' @importFrom data.table copy setcolorder setDT
#' @export
build_messages <- function(summarize = TRUE, split = FALSE, 
                           as_tibble = ironmarch_as_tibble()) {
  # handle CMD check notes on NSE ========================================================
  which_df <- NULL
  msg_id <- NULL
  # ======================================================================================
  
  check_summarize_and_split(summarize = summarize, split = split)
  
  orig <- setDT(copy(ironmarch::im_orig_dfs[["orig_message_posts"]]))
  core <- setDT(copy(ironmarch::im_core_dfs[["core_message_posts"]]))
  
  core[, which_df := "core"]
  setcolorder(core, "which_df")
  orig[, which_df := "orig"]
  setcolorder(orig, "which_df")
  
  out <- merge(orig, core, all = TRUE)
  
  if (summarize) {
    out <- out[
      order(which_df)
      ][, lapply(
        .SD, function(.x) if (.N == 1L) .x else .x[[which.min(is.na(.x))]]
        ),
        by = msg_id
        ][, which_df := NULL
          ]
  } else if (split) {
    out <- split(out, by = "msg_id")
  }

  .finalize_df(out, as_tibble = as_tibble)
}


#' Reconcile and Merge Members
#' 
#' `build_members()` reconciles and merges the members found in 
#' `im_orig_dfs$orig_members` and `im_core_dfs$core_members`.
#' 
#' Values found in `im_core_dfs$core_members` are preferred. Otherwise values found in
#' `im_orig_dfs$orig_members` are kept.
#' 
#' 
#' @template param-summarize
#' @template param-split
#' @template param-as_tibble
#' 
#' @template return-df
#' 
#' @template author-bk
#'
#' @examples 
#' # members summarized to single rows ===================================================
#' build_members()
#' 
#' # all member observations =============================================================
#' build_members(summarize = FALSE)
#' 
#' # all member observations split into a list of data frames ============================
#' split_members <- build_members(summarize = FALSE, split = TRUE)
#' 
#' # first three members that appear in both... ==========================================
#' # ... `im_orig_dfs$orig_members` and `im_core_dfs$core_members`
#' split_members[
#'   vapply(split_members, function(.x) nrow(.x) == 2, logical(1L))
#' ][1:3]
#'
#'
#' @importFrom data.table copy fifelse setcolorder setDT
#' @export
build_members <- function(summarize = TRUE, split = FALSE, 
                          as_tibble = ironmarch_as_tibble()) {
  # handle CMD check notes on NSE ========================================================
  msg_count_reset <- NULL
  msg_count_reset_at <- NULL
  which_df <- NULL
  member_id <- NULL
  # ======================================================================================
  
  check_summarize_and_split(summarize = summarize, split = split)

  orig <- setDT(copy(ironmarch::im_orig_dfs[["orig_members"]]))
  core <- setDT(copy(ironmarch::im_core_dfs[["core_members"]]))
  
  core[, msg_count_reset_at := fifelse(
    msg_count_reset > 1, 
    as.POSIXct(msg_count_reset, origin = "1970-01-01"), 
    as.POSIXct(NA_real_, origin = "1970-01-01")
    )][, msg_count_reset := NULL
       ]
  
  
  # raw to logical
  raw_cols <- names(core)[vapply(core, function(.x) is.raw(.x[[1L]]), logical(1L))]
  core[, (raw_cols) := lapply(.SD, function(.x) {
    vapply(.x, as.logical, logical(1L))
  }), .SDcols = raw_cols]

  # character to logical
  char_int_bool_cols <- c("restrict_post", "mod_posts", "temp_ban") 
  orig[, (char_int_bool_cols) := lapply(.SD, function(.x) {
    fifelse(.x == "1", TRUE, FALSE)
  }), .SDcols = char_int_bool_cols]
  
  # integer to logical
  shifted_int_bool_cols <- c("restrict_post", "mod_posts", "temp_ban")
  core[, (shifted_int_bool_cols) := lapply(.SD, function(.x) {
    fifelse(.x == -1L, TRUE, FALSE)
  }), .SDcols = shifted_int_bool_cols]
  
  core[, which_df := "core"]
  setcolorder(core, "which_df")
  orig[, which_df := "orig"]
  setcolorder(orig, "which_df")
  
  out <- merge(orig, core, all = TRUE)
  
  if (summarize) {
    out <- out[
      order(which_df)
      ][, lapply(
        .SD, function(.x) if (.N == 1L) .x else .x[[which.min(is.na(.x))]]
        ),
        by = member_id
        ][, which_df := NULL
          ]
  } else if (split) {
    out <- split(out, by = "member_id")
  }
  
  .finalize_df(out, as_tibble = as_tibble)
}







