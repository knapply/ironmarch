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
#' 
#' @export
ironmarch_options <- function() {
  list(
    ironmarch.as_tibble = ironmarch_as_tibble()
  )
}

#' @rdname ironmarch-options
#' 
#' @export
ironmarch_as_tibble <- function(default = TRUE) {
  getOption("ironmarch_options.as_tibble", default = default)
}
