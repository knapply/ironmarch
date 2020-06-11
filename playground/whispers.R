clean_and_parse_ndjson <- function(file_path, verbose = TRUE) {
  if (!requireNamespace("readr", quietly = TRUE)) {
    stop("{readr} is required", call. = FALSE)
  }
  if (!requireNamespace("stringi", quietly = TRUE)) {
    stop("{stringi} is required", call. = FALSE)
  }
  if (!requireNamespace("jsonify", quietly = TRUE)) {
    stop("{jsonify} is required", call. = FALSE)
  }
  
  raw_json <- readr::read_file(file_path)
  stripped_json <- stringi::stri_replace_all_regex(raw_json, "[\n\t\r]", "")
  
  ndjson <- stringi::stri_replace_all_fixed(stripped_json, "}{", "}\n{")
  split_lines <- stringi::stri_split_lines1(ndjson)
  
  are_valid_json <- vapply(split_lines, jsonify::validate_json, logical(1L),
                           USE.NAMES = FALSE)
  if (verbose && any(!are_valid_json)) {
    message("invalid JSON detected at lines:\n",
            paste("\t-", head(which(!are_valid_json)), "\n"))
  }
  
  valid_lines <- split_lines[are_valid_json]

  lapply(head(valid_lines), jsonify::from_json, fill_na = TRUE)
}

file_dir <- "~/Downloads/Whispers1"
file_paths <- as.list(dir(file_dir, full.names = TRUE))
names(file_paths) <- dir(file_dir)

channels <- clean_and_parse_ndjson(file_paths$channels.json)
guilds <- clean_and_parse_ndjson(file_paths$guilds.json)
users <- clean_and_parse_ndjson(file_paths$users.json)
messages <- clean_and_parse_ndjson(file_paths$`messages-REDACTED.json`)
channels <- clean_and_parse_ndjson(file_paths$channels.json)


init <- readr::read_lines(file_paths$`messages-REDACTED.json`)

init2 <- paste0(init, collapse = "")

init[[1]]






.get_mutualguilds <- function(mutualguilds) {
  # init <- lapply(x, function(.x) {
  #   list(
  #     name = .x$name %||% NA_character_,
  #     nickname = .x$nickname %||% NA_character_,
  #     ownerid = .x$ownerid %||% NA_character_
  #   )
  # })
  unique(data.table::rbindlist(mutualguilds), fill = TRUE)
}

clean_users.json <- function(file_path) {
  init <- clean_and_parse_ndjson(file_path)
  
  res <- lapply(init[1:5], function(.x) {
    row <- list(
      userid = .x$userid %||% NA_character_,
      username = .x$username %||% NA_character_,
      socialaccounts = .x$socialaccounts %||% NA_character_,
      mutualguilds = .get_mutualguilds(.x$mutualguilds)
    )
    
    data.table::as.data.table(row)
    
    # .get_mutualguilds(.x$mutualguilds)
  })
  
  data.table::rbindlist(res)
}



dt <- data.table::rbindlist(lapply(init, data.table::as.data.table),
                            fill = TRUE)

list_cols <- names(dt)[vapply(dt, is.recursive, logical(1L), USE.NAMES = FALSE)]

dt[, (list_cols) := lapply(.SD, 
                           function(.x) {
                             lens <- vapply(.x, length, integer(1L))
                             .x[lens == 0L] <- NA
                             if (any(lens > 1L)) return(.x)
                             unlist(.x, use.names = FALSE)
                             }),
   .SDcols = list_cols]

data.table::rbindlist(init[1])
