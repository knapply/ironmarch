#' Build a Members Data Frame with Geocoded IP Addresses
#'
#' @param all_geo_cols `logical(1L)`, Default `TRUE`.
#' Whether to return all georeferncesd columns.
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
#' @importFrom data.table data.table setDT
#' @export
im_geocode_members <- function(all_geo_cols = TRUE,
                               as_tibble = ironmarch_as_tibble(),
                               as_sf = ironmarch_as_sf()) {
  if (all_geo_cols) {
    joiner <- .all_geocoded_ips_df
  } else {
    joiner <- .all_geocoded_ips_df[, .(ip_address, lat, lon)]
  }
  
  out <- setDT(build_members())[joiner, on = "ip_address"]

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
