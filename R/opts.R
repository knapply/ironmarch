#' @name ironmarch-options
#'
#' @title `{ironmarch}` Options
#'
#' @param default `TRUE`
#'
#' @template author-bk
#'
#' @examples
#' ironmarch_options()
#' @export
ironmarch_options <- function() {
  list(
    ironmarch.as_tibble = ironmarch_as_tibble(),
    ironmarch_as_sf = ironmarch_as_sf()
  )
}

#' @rdname ironmarch-options
#'
#' @export
ironmarch_as_tibble <- function(default = TRUE) {
  getOption("ironmarch_as_tibble", default = default)
}

#' @rdname ironmarch-options
#'
#' @export
ironmarch_as_sf <- function(default = TRUE) {
  getOption("ironmarch_as_sf", default = default)
}
