if (requireNamespace("tibble", quietly = TRUE)) {
  print.data.table <- function(x, ...) print(tibble::as_tibble(x), ...)
}

exec_docker <- function(target_dir = "db-dissection/iron-march-leak-helper-master/",
                        docker_file = "docker-compose.yml") {
  full_docker_file <- paste0(target_dir, docker_file)

  if (!dir.exists(target_dir)) {
    stop("`target_dir` not found:\n\t- ", target_dir)
  }
  if (!file.exists(full_docker_file)) {
    stop("`docker_file` not found:\n\t- ", full_docker_file)
  }

  wd <- getwd()
  setwd(target_dir)
  on.exit(setwd(wd))

  cmd <- "docker-compose up"
  tryCatch(system(cmd, wait = FALSE, ignore.stdout = TRUE),
           warning = function(w) stop(w))
}

kill_docker <- function(target_dir = "db-dissection/iron-march-leak-helper-master/") {
  if (!dir.exists(target_dir)) {
    stop("`target_dir` not found:\n\t- ", target_dir)
  }

  wd <- getwd()
  setwd(target_dir)
  on.exit(setwd(wd))
  
  cmd <- "docker-compose down"
  tryCatch(system(cmd, wait = FALSE, ignore.stdout = TRUE),
           warning = function(w) stop(w))
}


# library(purrr)


get_tables <- function() {
  exec_docker()
  
  Sys.sleep(10)
  con <- DBI::dbConnect(
    drv = RMariaDB::MariaDB(),
    host = "0.0.0.0",
    port = "33060",
    user = "user",
    password = "user",
    db = "iron_march"
  )
  
  to_drop <- c("core_theme_resources")
  
  tables <- sort(
    setdiff(odbc::dbListTables(con), 
            to_drop)
  )
  names(tables) <- tables
  
  out <- lapply(tables, function(.x) {
    data.table::as.data.table(DBI::dbReadTable(con, name = .x))[]
  })
  
  DBI::dbDisconnect(con)
  kill_docker()
  
  out[]
}




drop_all_na_cols <- function(df) {
  atomic_cols <- names(df)[vapply(df, is.atomic, logical(1L))]
  if (length(atomic_cols)) {
    all_na_cols <- names(
      which(
        vapply(df, function(.x) all(is.na(.x)), logical(1L))
      )
    )
    
    if (length(all_na_cols)) {
      df[, (all_na_cols) := NULL]
    }
  }
  df
}

recode_empty_strings <- function(df) {
  chr_cols <- names(df)[vapply(df, is.character, logical(1L))]
  if (length(chr_cols)) {
    df[, (chr_cols) := lapply(.SD, function(.x) {
      data.table::fifelse(nchar(stringi::stri_trim_both(.x)) == 0L, 
                          NA_character_, .x)
    }), .SDcols = chr_cols]
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
  # lgl_cols <- intersect(
  #   names(df),
  #   c("restrict_post", "notify_read")
  # )
  int_cols <- names(df)[vapply(df, is.integer, logical(1L))]
  if (length(int_cols)) {
    int_df <- df[, ..int_cols]
    lgl_cols <- names(
      int_df
      )[vapply(int_df,
               function(.x) all(.x == 0L | .x == 1L | is.na(.x)),
               logical(1L))
        ]

    if (length(lgl_cols)) {
      df[, (lgl_cols) := lapply(.SD, function(.x) {
        data.table::fcase(.x == 0L, FALSE,
                          .x == 1L, TRUE,
                          is.na(.x), NA)
      }), .SDcols = lgl_cols]
    }
  }
  df
}

parse_dttm <- function(x, time_zone = "UTC", warn = TRUE) {
  if (inherits(x, "POSIXct")) {
    return(x)
  }
  
  if (all(is.na(x))) {
    out <- structure(rep(NA_real_, length(x)), 
                     class = c("POSIXct", "POSIXt"), tzone = "UTC")
    return(out)
  }

  if (inherits(x, "integer64")) {
    x[x == 0] <- NA
    out <- as.POSIXct(as.double(x), tz = "UTC", origin = "1970-01-01")
    return(out)
  }
  
  if (is.numeric(x)) {
    x[x == 0] <- NA
    out <- as.POSIXct(x, tz = "UTC", origin = "1970-01-01")
    return(out)
  }
  
  if (is.character(x)) {
    if (grepl("^\\d+$", x[[1L]])) {
      x <- as.double(x)
      x[x == 0] <- NA_real_
      out <- as.POSIXct(as.double(x), tz = "UTC", origin = "1970-01-01")
    } else {
      out <- as.POSIXct(x, tz = "UTC", origin = "1970-01-01")
    }
    return(out)
  }
  
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
      "notify_sent", "member_login_key_expire", "edit_time", "post_date", "pdelete_time",
      "last_real_post", "start_date", "last_post",
      
      NULL)
  )
  
  if (length(dttm_cols)) {
    df[, (dttm_cols) := lapply(.SD, parse_dttm),
       .SDcols = dttm_cols]
  }
  
  df
}

jsonlify_list_cols <- function(x) {
  list_cols <- names(which(vapply(x, is.list, logical(1L))))
  
  if (length(list_cols)) {
    x[, (list_cols) := lapply(.SD, function(.x) {
      vapply(.x, jsonlite::toJSON, character(1L))
      }),
      .SDcols = list_cols]
  }
  
  x
}



clean_df <- function(x) {
  recode_empty_strings(x)
  drop_all_na_cols(x)
  drop_junk_cols(x)
  clean_dttm_cols(x)
  clean_lgl_cols(x)
  jsonlify_list_cols(x)
  clean_lgl_cols(x)
  
  
  x
}

all_tables <- get_tables()
cleaned <- lapply(data.table::copy(all_tables), clean_df)
to_write <- cleaned[vapply(cleaned, 
                           function(.x) ncol(.x) != 0 && nrow(.x) != 0,
                           logical(1L))]

to_gzip <- c("forums_posts", "orig_posts", "core_search_index")
for (i in seq_along(to_write)) {
  df <- to_write[[i]]
  name <- names(to_write)[[i]]

  if (name %in% to_gzip) {
    path <- sprintf("db-dissection/csvs/%s.csv.gz", name)
  } else {
    path <- sprintf("db-dissection/csvs/%s.csv", name)
  }
  
  data.table::fwrite(
    x = df,
    file = path
  )
}

































# no_list_cols %>% 
#   iwalk(~ data.table::fwrite(x = .x, file = glue::glue("db-dissection/csvs/{.y}.csv")))
# 
# 
# 
# all_tables %>% 
#   keep(~ "list" %in% unlist(lapply(.x, class))) %>% 
#   map(dplyr::select_if, is.list)
#   map(~ unique(unlist(lapply(.x, class)))) %>% 
#   unlist()
# 
# 
# odbc::dbListTables(db) %>% 
#   sort() %>% 
#   set_names() %>% 
#   map(~ DBI::dbReadTable(db, .x)) %>% 
#   discard(~ nrow(.x) == 0L || ncol(.x) == 0L) %>% 
#   iwalk(~ {
#     cat("\t\t\t\t\t**", .y, "**")
#     cat("\n")
#     dplyr::glimpse(.x)
#     cat("\n")
#   })
# 
# odbc::dbListTables(db) %>% 
#   sort() %>% 
#   set_names() %>% 
#   map(~ DBI::dbReadTable(db, .x)) %>% 
#   discard(~ nrow(.x) == 0L || ncol(.x) == 0L) %>% 
#   names()