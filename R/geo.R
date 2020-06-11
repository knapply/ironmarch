.find_geocodable_member_dfs <- function(x, dttm_cols) {
  names(x)[
    vapply(x, function(.x) {
      any(grepl("ip_address", names(.x))) &&
        "member_id" %chin% names(.x) &&
        any(dttm_cols %chin% names(.x))
    }, logical(1L))
  ]
}


.get_geocodable_member_dfs <- function() {
  dttm_cols = c("ctime", "joined",
                "entry_date",
                "vote_date",
                "running_time")
  is_dbl_or_int <- function(x) {
    is.double(x) | is.integer(x)
  }
  
  
  init <- lapply(
    c(im_orig_dfs[.find_geocodable_member_dfs(im_orig_dfs, dttm_cols)],
      im_core_dfs[.find_geocodable_member_dfs(im_core_dfs, dttm_cols)]),
    function(.x) setDT(copy(.x))
  )

  res <- lapply(
    init, 
    function(.x) {
      dttm_matches <- intersect(names(.x), dttm_cols)
      # TODO fix these columns in initial database cleaning
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
  
  unique(
    rbindlist(
      lapply(res, setnames, c("member_id", "ip_address", "time")),
      idcol = "ip_address_table",
      use.names = TRUE
    )
  )
}

#' Build a Members Data Frame with Geocoded IP Addresses
#'
#' @param all_geo_cols `logical(1L)`, Default `TRUE`.
#' Whether to return all georeferenced columns.
#'
#' @template param-as_tibble
#' @template param-as_sf
#'
#' @template author-bk
#' 
#' @examples 
#' geocoded_members <- im_geocode_members()
#' geocoded_members
#' 
#' geocoded_cols <-  c("country", "countryCode", "region", "regionName", 
#'                     "city", "zip", "timezone", "isp", "org", "as")
#' geocoded_members[, c("name", geocoded_cols)]
#' 
#' plot(im_geocode_members(as_sf = FALSE)[c("lon", "lat")])
#'
#' @export
im_geocode_members <- function(all_geo_cols = TRUE,
                               as_tibble = ironmarch_as_tibble(),
                               as_sf = ironmarch_as_sf()) {
  if (all_geo_cols) {
    joiner <- all_geocoded_ips_df
  } else {
    joiner <- all_geocoded_ips_df[, .(ip_address, lat, lon)]
  }

  # out <- merge(
    # joiner, combo_members_df[, !names(combo_members_df) == "ip_address"],
    # by = "member_id"
  # )

  out <- data.table(combo_members_df)[joiner, on = "ip_address", nomatch = 0]

  if (as_tibble && requireNamespace("tibble", quietly = TRUE)) {
    out <- tibble::as_tibble(out)
  }

  if (as_sf && requireNamespace("sf", quietly = TRUE)) {
    out <- sf::st_as_sf(
      out,
      coords = c("lon", "lat"),
      crs = 4326L
    )
  }

  out
}
