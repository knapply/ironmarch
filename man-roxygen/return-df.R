#' @return 
#' * Data Frame
#'   + default: a [tibble::tibble()] if `as_tibble` is `TRUE` and `{tibble}` is installed.
#'   + alternative: a [data.table::data.table()]
#' * If `split` is `TRUE` and `summarize` is `FALSE`, the result will be a `list()` of
#'   data frames.
