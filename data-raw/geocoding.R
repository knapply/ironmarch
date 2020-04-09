ip_address <- ironmarch::combo_members_df$ip_address


# init <- lapply(.ip_addresses, function(.x) {
#   res <- rgeolocate::ip_api(
#     ip_addresses = .x,
#     as_data_frame = FALSE,
#     delay = TRUE
#   )
#   Sys.sleep(1)
#   res
# })

init <- readRDS("inst/notforgit/geocoded.rds")

geococoded <- unlist(init, recursive = FALSE)
geococoded_df <- data.table::rbindlist(
  lapply(geococoded, as.list)
)

chr_cols <- names(
  geococoded_df
)[vapply(geococoded_df, is.character, logical(1L))]

if (length(chr_cols)) {
  geococoded_df[, (chr_cols) := lapply(.SD, function(.x) {
    data.table::fifelse(nchar(.x) == 0L, NA_character_, .x)
  }), .SDcols = chr_cols]
}

# styler: off
.geocoded_ips_df <- unique(
  data.table::data.table(
    ip_address = ip_address
    )[geococoded_df, on = .(ip_address == query)
      ][, lat := as.double(lat)
        ][, lon := as.double(lon)
          ][]
)
# styler: on

usethis::use_data(.geocoded_ips_df, internal = TRUE, overwrite = TRUE)


# ip_address <- ips
# decode_ip <- function(ip_address) {
#   # ip_regex <- "^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$"
#   # valid_ip_addresses <- ip_address[grepl(ip_regex, ip_address)]
#   .ip_addresses <- unique(ip_address)
#
#   # init <- lapply(.ip_addresses, function(.x) {
#   #   res <- rgeolocate::ip_api(
#   #     ip_addresses = .x,
#   #     as_data_frame = FALSE,
#   #     delay = TRUE
#   #   )
#   #   Sys.sleep(1)
#   #   res
#   # })
#
#   geococoded <- unlist(init, recursive = FALSE)
#
#   geococoded_df <- data.table::rbindlist(
#     lapply(geococoded, as.list)
#   )
#
#
#   # styler: off
#   out <- data.table::data.table(
#     ip_address = ip_address
#     )[geococoded_df, on = .(ip_address == query)
#       ][, success := status == "success"
#         ][, lat := as.double(lat)
#           ][, lon := as.double(lon)
#             ][]
#   # styler: on
#
#   successes <- geococoded[vapply(
#     geococoded, function(.x) .x[["status"]] == "success",
#     logical(1L)
#   )]
#   names(successes) <- vapply(successes, `[[`, character(1L), "query")
#
#   st_points <- lapply(successes, function(.x) {
#     coords <- .x[c("lon", "lat")]
#     sf::st_point(as.double(coords))
#   })
#
#   test <- data.table::data.table(
#     ip_address = ip_address,
#     geometry = sf::st_sfc(unname(st_points[ip_address]))
#   )
#
#   # sf::st_sfc(unname(test))
#   #
#   #
#   #
#   # init <- lapply(ip_address, rgeolocate::ip_api(), as_data_frame = FALSE)
#   #
#   # res_mat <- lapply(lapply(init, `[[`, 1L), `[`, c("lon", "lat"))
#   #
#   # out <- lapply(res_mat, function(.x) sf::st_point(as.double(.x)))
#   # sf::st_sfc(out, crs = 4326L)
#   #
#   # coord_mat <- structure(
#   #   as.double(res_mat[, c("lon", "lat")]),
#   #   .Dim = c(nrow(res_mat), 2L),
#   #   .Dimnames = list(NULL, c("lon", "lat"))
#   # )
#   #
#   # apply(coord_mat, 1L, sf::st_point)
#   # sf::st_point(coord_m)
# }
