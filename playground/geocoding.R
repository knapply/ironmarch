
c(
  names(purrr::keep(im_orig_dfs, ~ any(grepl("ip_address", names(.x))))),
  names(purrr::keep(im_core_dfs, ~ any(grepl("ip_address", names(.x)))))
) %>% unique()

ip_dfs <- unique(
  c(
  purrr::keep(im_orig_dfs, ~ any(grepl("ip_address", names(.x)))),
  purrr::keep(im_core_dfs, ~ any(grepl("ip_address", names(.x))))
  )
)


ip_dfs_w_members <- purrr::keep(ip_dfs, ~ any(grepl("^member_id$", names(.x))))

ip_dfs_w_members_and_dates <- purrr::keep(
  ip_dfs_w_members, ~ any(grepl("date|time|joined", names(.x)))
)

ip_dfs_w_members_and_dates <- lapply(ip_dfs_w_members_and_dates,
                                     data.table::setDT)



dttm_cols <- c(
  "ctime", "joined", "entry_date", "vote_date",
  "running_time"
)

is_dbl_or_int <- function(x) {
  is.double(x) | is.integer(x)
}

init <- lapply(
  ip_dfs_w_members_and_dates, 
  function(.x) {
    dttm_matches <- intersect(names(.x), dttm_cols)
    
    if (length(dttm_matches)) {
      non_posixct_cols <- dttm_matches[
        vapply(.x[, ..dttm_matches], is_dbl_or_int, logical(1L))
      ]

      if (length(non_posixct_cols)) {
        .x[, (non_posixct_cols) := lapply(.SD, as.POSIXct,
                                          origin = "1970-01-01"),
           .SDcols = non_posixct_cols]
      }
      
      out_cols <- c("member_id", "ip_address", dttm_matches)
      
      .x[!is.na(member_id), ..out_cols]
    }

  }
)

res <- unique(
  data.table::rbindlist(
    lapply(init, data.table::setnames, c("member_id", "ip_address", "DTTM"))
  )
)

res[, .N, by = .(member_id, ip_address)][order(-N)]

joined <- res[all_geocoded_ips_df, on = "ip_address",
              nomatch = 0]

test <- unique(
  joined[member_id == 1, .(member_id, DTTM, lon, lat)]
)

plot(test[, .(lon, lat)])

sf <- sf::st_as_sf(joined, coords = c("lon", "lat"), crs = 4326L)
mapview::mapview(sf)
