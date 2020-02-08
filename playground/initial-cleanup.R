# if (!requireNamespace("data.table", quietly = TRUE) 
#     || packageVersion("data.table") < "1.12.4") {
#   install.packages("data.table")
#   data.table::update.dev.pkg()
# }

if (requireNamespace("tibble", quietly = TRUE)) {
  print.data.table <- function(x, ...) print(tibble::as_tibble(x), ...)
  print.data.frame <- print.data.table
}

# if (!requireNamespace("dplyr")) {
#   stop("{dplyr}'s `dplyr::glimpse()` is required to produce outputs.", call. = FALSE)
# }

library(data.table)
library(purrr)
# all_orig$orig_rc_classes %>% dplyr::glimpse()

junk_file_paths <- function(orig = TRUE, core = TRUE) {
  orig_junk <- c(
    "orig_attachments_type",
    "orig_cache_store",
    "orig_content_cache_sigs",
    "orig_core_applications",
    "orig_core_hools_files",
    "orig_core_hooks",
    "orig_core_item_markers_storage",
    "orig_core_like_cache",
    "orig_core_share_links",
    "orig_core_sys_lang_words",
    "orig_core_sys_module",
    "orig_custom_bbcode",
    "orig_pfields_content",
    "orig_pfields_data",
    "orig_pfields_groups",
    NULL
  )
  core_junk <- c(
    # "core_members_warn_reasons",
    "core_acp_search_index",
    "core_cache",
    "core_group_promotions",
    "core_hook_files",
    "core_themes",
    "core_theme_templates",
    "core_theme_settings_values",
    "profile_sync",
    "x_utf_convert_session",
    "core_tasks",
    "core_sys_login",
    "core_file_logs",
    "core_file_storage",
    "core_tags_cache",
    "core_sys_conf_settings",
    "core_item_markers",
    "core_javascript",
    "core_leaders",
    "core_social_promote_sharers",
    "core_like_cache",
    "core_login_handlers",
    "core_menu",
    "core_moderators",
    "core_modules",
    "core_notification_defaults",
    "core_pfields_data",
    "core_reputation_levels",
    "orig_cal_calendars",
    "orig_skin_templates",
    NULL
  )
  
  out <- NULL
  if (orig) {
    out <- c(out, orig_junk)
  }
  if (core) {
    out <- c(out, core_junk)
  }
  
  if (is.null(out)) {
    stop("No paths to return")
  }

  paste0(out, ".csv")
}


get_csv_paths <- function(target_dir, junk_only = FALSE, junk_files = junk_file_paths()) {
  if (!dir.exists(target_dir)) {
    stop("`target_dir` not found.")
  }
  out <- dir(target_dir, pattern = "\\.csv$", full.names = TRUE, ignore.case = TRUE)
  if (junk_only) {
    out <- out[basename(out) %chin% junk_files]
  } else {
    out <- out[!basename(out) %chin% junk_files]
  }
  
  names(out) <- sub("\\.csv$", replacement = "", basename(out))
  as.list(out)
}

csv_file_paths <- get_csv_paths("inst/raw-data/iron_march_201911/csv/")

clean_chr_cols <- function(df) {
  chr_cols <- names(df)[vapply(df, is.character, logical(1L))]
  if (length(chr_cols)) {
    df[, (chr_cols) := lapply(.SD, function(.x) {
      fifelse(nchar(.x) == 0L, NA_character_, .x)
    }), .SDcols = chr_cols]
  }
  df
}

parse_dttm <- function(x, time_zone = "UTC", warn = TRUE) {
  if (all(is.na(x))) {
    out <- structure(rep(NA_real_, length(x)), 
                     class = c("POSIXct", "POSIXt"), tzone = "UTC")
  }
  
  if (is.numeric(x)) {
    x[x == 0] <- NA
    out <- as.POSIXct(x, tz = "UTC", origin = "1970-01-01")
  }

  if (is.character(x)) {
    if (grepl("^\\d+$", x[[1L]])) {
      x <- as.double(x)
      x[x == 0] <- NA_real_
      out <- as.POSIXct(as.double(x), tz = "UTC", origin = "1970-01-01")
    } else {
      out <- as.POSIXct(x, tz = "UTC", origin = "1970-01-01")
    }
  }
  
  out
}

clean_dttm_cols <- function(df) {
  dttm_cols <- intersect(
    names(df),
    c("msg_date", "joined", "photo_last_update", "last_post", "admin_time",
      "ban_date", "dellog_deleted_date", "follow_added", "follow_notify_sent",
      "attach_date", "upgrade_date", "index_date_created", "index_date_updated",
      "log_date", "sdl_obj_date", "tag_added", "tag_cache_date", "mt_date",
      "mt_start_time", "mt_last_post_time", "start_date", "comment_date",
      "first_report_date", "last_updated", "entry_date", "event_approved_on",
      "event_last_comment", "event_end_date", "event_last_review", "date",
      "session_created", "session_updated", "rep_date", "cache_date",
      "pp_profile_update", "ctime", "map_read_time", "map_last_topic_reply",
      "last_visit", "last_activity", "wl_date",
      "event_saved", "event_lastupdated", "event_start_date", "event_end_date",
      "cache_updated", "app_added", "hook_installed", "hook_updated", "item_last_saved",
      "notify_sent", "member_login_key_expire")
  )

  if (length(dttm_cols)) {
    df[, (dttm_cols) := lapply(.SD, parse_dttm),
       .SDcols = dttm_cols]
  }

  df
}

clean_html_cols <- function(df) {
  html_cols <- intersect(
    c("msg_post"),
    names(df)
  )
  if (length(html_cols)) {
    df[, (html_cols) := lapply(.SD, function(.x) {
      vapply(.x, function(.y) {
        rvest::html_text(xml2::read_html(.y))
      }, character(1L), USE.NAMES = FALSE)
    }), .SDcols = html_cols]
  }
  df
}

clean_json_cols <- function(df) {
  json_cols <- intersect(
    names(df),
    c("pp_last_visitors")
  )
  if (length(json_cols)) {
    df[, (json_cols) := lapply(.SD, function(.x) {
      if (jsonlite::validate(.x[[1]])) {
        init <- .x
      } else {
        init <- stringi::stri_replace_all_regex(.x, '\"{2}', '"')
        init[is.na(init)] <- "[]"
      }
      
      parsed <- tryCatch(
        lapply(init, jsonlite::parse_json),
        error = function(e) NULL
      )
      if (is.null(parsed)) return(.x)
      
      lapply(parsed, function(.y) {
        if (!length(names(.y))) {
          return(data.table())
        }
        data.table(
          member_id = as.integer(names(.y)),
          visit_time = as.POSIXct(as.double(.y), tz = "UTC", origin = "1970-01-01")
        )
      })
    }),
       .SDcols = json_cols]
  }
  df
}

drop_all_na_cols <- function(df) {
  atomic_cols <- names(df)[vapply(df, is.atomic, logical(1L))]
  if (length(atomic_cols)) {
    all_na_cols <- vapply(df, function(.x) !all(is.na(.x)),
                          logical(1L))
    df <- df[, ..all_na_cols]
  }
  df
}

drop_junk_cols <- function(df, min_unique_vals = 2L) {
  junk_cols <- intersect(
    names(df),
    c("pconversation_filters")     # only 3 unique values, seems useless
  )
  
  bad_unique_cols <- names(
    df
    )[vapply(df, function(.x) length(unique(.x)) < min_unique_vals, logical(1L))
      ]
  
  cols_to_drop <- unique(c(junk_cols, bad_unique_cols))
  
  if (length(cols_to_drop)) {
    df[, (cols_to_drop) := NULL]
  }
  df
}

clean_lgl_cols <- function(df) {
  lgl_cols <- intersect(
    names(df),
    c("restrict_post", "notify_read")
  )
  if (length(lgl_cols)) {
    df[, (lgl_cols) := lapply(.SD, function(.x) {
      fcase(.x == 0L, FALSE,
            .x == 1L, TRUE,
            is.na(.x), NA)
      }), .SDcols = lgl_cols]
  }
  df
}

read_clean_csv <- function(file_path) {
  init <- fread(file_path, encoding = "UTF-8")
  init <- drop_junk_cols(init, min_unique_vals = 3)
  
  clean_chr_cols(init)
  tryCatch(clean_dttm_cols(init),
           warning = function(w) {
             print(basename(file_path))
             stop(w)
           })
  clean_html_cols(init)
  clean_json_cols(init)
  clean_lgl_cols(init)
  
  drop_all_na_cols(init)
}





walk_glimpse <- function(x) {
  purrr::iwalk(x, ~ { cat("\t**", .y, "**\n\n"); dplyr::glimpse(.x); cat("\n\n") })
}


core_csvs <- csv_file_paths[grepl("/core_", csv_file_paths)]
all_core <- lapply(core_csvs, read_clean_csv)
walk_glimpse(all_core)

# orig_csvs <- csv_file_paths[grepl("/orig_", csv_file_paths)]
# all_orig <- lapply(orig_csvs, read_clean_csv)
# walk_glimpse(all_orig)
# 
# other_csvs <- csv_file_paths[!unlist(csv_file_paths) %chin% unlist(c(core_csvs, orig_csvs))]
# all_other <- lapply(other_csvs, read_clean_csv)
# walk_glimpse(all_other)
# 






# all_orig$orig_admin_login_logs
# 
# 
# 
# 
# 
# 
# 
# 
# init <- read_clean_csv(csv_file_paths$core_upgrade_history)
# dplyr::glimpse(init)
# 
# # core ===================================================================================
# #* members ===============================================================================
# core_members <- read_clean_csv(csv_file_paths$core_members)
# core_members_known_devices <- read_clean_csv(csv_file_paths$core_members_known_devices)
# # core_members_warn_reasons <- read_clean_csv(csv_file_paths$core_members_warn_reasons)
# 
# core_members[core_members_known_devices, , on = "member_id", nomatch = 0]
# 
# #* activity ==============================================================================
# core_follow <- read_clean_csv(csv_file_paths$core_follow)
# core_attachments <- read_clean_csv(csv_file_paths$core_attachments)
# core_message_posts <- read_clean_csv(csv_file_paths$core_message_posts)
# core_message_topics <- read_clean_csv(csv_file_paths$core_message_topics)
# 
# #* admin =================================================================================
# core_admin_login_logs <- read_clean_csv(csv_file_paths$core_admin_login_logs)
# core_banfilters <- read_clean_csv(csv_file_paths$core_banfilters)
# core_deletion_log <- read_clean_csv(csv_file_paths$core_deletion_log)
# core_upgrade_history <- read_clean_csv(csv_file_paths$core_upgrade_history)
# core_moderator_logs <- read_clean_csv(csv_file_paths$core_moderator_logs)
# 
# #* other =================================================================================
# core_emoticons <- read_clean_csv(csv_file_paths$core_emoticons)
# core_search_index <- read_clean_csv(csv_file_paths$core_search_index)
# 
# all_core <- lapply(csv_file_paths[grepl("/core_", csv_file_paths)], read_clean_csv)
# 
# all_core$core_tasks %>% dplyr::glimpse()
# 
# 
# # orig ===================================================================================
# #* members ================================================================================
# orig_members <- read_clean_csv(csv_file_paths$orig_members)
# orig_members_warn_logs <- read_clean_csv(csv_file_paths$orig_members_warn_logs)



# ip_test <- rgeolocate::ip_api(unique(init$msg_ip_address)[1:3])
# as.list(ip_test)
