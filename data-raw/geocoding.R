# all IP addresses =============================================================
.extract_ips <- function(df) {
  ip_cols <- grep("ip_address", names(df), value = TRUE)
  if (!length(ip_cols)) {
    return(NULL)
  }
  out <- df[ip_cols]
  unique(out[!is.na(out)])
}

extract_ips <- function(...) {
  unique(
    unlist(
      lapply(list(...), lapply, .extract_ips),
      use.names = FALSE
    )
  )
}

all_ips <- extract_ips(ironmarch::im_orig_dfs, ironmarch::im_core_dfs)
names(all_ips) <- all_ips

geocode_ip <- function(ip) {
  rgeolocate::ip_api(ip_addresses = ip, as_data_frame = FALSE, delay = TRUE)
}


is_failure <- function(x) {
  unlisted <- unlist(x, use.names = FALSE)
  length(unlisted) == 1L && unlisted == "Error"
}

# this takes > 15 hours to run =================================================
# geocoding_results <- lapply(all_ips, function(.x) {
#   Sys.sleep(1L)
#   res <- geocode_ip(.x)
# 
#   if (is_failure(res)) {
#     n_attempts <- 1L
#     while (is_failure(res) && n_attempts < 5L) {
#       Sys.sleep(n_attempts)
#       res <- geocode_ip(.x)
#       n_attempts <- n_attempts + 1L
#     }
#   }
#   print(unlist(res))
#   res
# })

# readr::write_rds(geocoding_results, 
#                  path = "inst/notforgit/geocoding_results.rds")


geococoded <- unlist(
  readRDS("inst/notforgit/geocoding_results.rds"), 
  recursive = FALSE)

all_geocoded_ips_df <- data.table::rbindlist(
  lapply(geococoded, as.list),
  idcol = "ip_address"
)

stopifnot(
  nrow(all_geocoded_ips_df) == nrow(all_geocoded_ips_df[ip_address == query])
)

all_geocoded_ips_df[, query := NULL]

chr_cols <- names(
  all_geocoded_ips_df
)[vapply(all_geocoded_ips_df, is.character, logical(1L))]

if (length(chr_cols)) {
  all_geocoded_ips_df[, (chr_cols) := lapply(.SD, function(.x) {
    data.table::fifelse(nchar(.x) == 0L, NA_character_, .x)
  }), .SDcols = chr_cols]
}

all_geocoded_ips_df[, lat := as.double(lat)
                    ][, lon := as.double(lon)
                      ]

usethis::use_data(all_geocoded_ips_df, overwrite = TRUE)
