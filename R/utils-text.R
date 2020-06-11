#' Parse and Extract HTML Elements
#'
#' The messages in `{ironmarch}`'s data are HTML. The `extract_*()` functions facilitate
#' working with them.
#'
#' @param x `character()`. HTML text to parse.
#'
#' @param tag `character(1L)`. HTML tag to extract.
#'
#' @param collapse `character(1L)` or `NULL`, Default: `"\n"`. String to collapse multiple
#' results by. If `NULL`, a `list()` is returned.
#'
#' @template param-dots
#'
#' @return If `collapse` is not `NULL`, a `character()`. Otherwise, a `list()`
#' containing `character()`s.
#'
#' @template author-bk
#' @template author-an
#'
#' @examples
#' messages <- im_core_dfs$core_message_posts$msg_post[c(51, 119)]
#' messages
#'
#' extract_html_tags(messages, "p")
#'
#' extract_text(messages) # same as `extract_html_tags(messages, tag = "p")`
#'
#' extract_links(messages) # same as `extract_html_tags(messages, tag = "a", collapse = NULL)`
#' @export
extract_html_tags <- function(x, tag, collapse = "\n", ...) {
  if (!requireNamespace("xml2", quietly = TRUE)) {
    stop("{xml2} is required for this functionality.", call. = FALSE)
  }
  if (!requireNamespace("rvest", quietly = TRUE)) {
    stop("{rvest} is required for this functionality.", call. = FALSE)
  }
  if (!requireNamespace("stringr", quietly = TRUE)) {
    stop("{stringr} is required for this functionality.", call. = FALSE)
  }

  rawified <- lapply(x, charToRaw)
  parsed <- lapply(rawified, xml2::read_html)

  if (is.null(collapse)) {
    lapply(parsed, function(.x) {
      res <- xml2::xml_text(rvest::html_nodes(.x, tag))
      if (length(res)) res else NA_character_
    })
  } else {
    vapply(parsed, function(.x) {
      res <- xml2::xml_text(rvest::html_nodes(.x, tag))
      if (length(res)) paste0(res, collapse = collapse) else NA_character_
    },
    FUN.VALUE = character(1L), USE.NAMES = FALSE
    )
  }
}


#' @rdname extract_html_tags
#'
#' @export
extract_text <- function(x, collapse = "\n", ...) {
  extract_html_tags(x, tag = "p", collapse = collapse, ...)
}


#' @rdname extract_html_tags
#'
#' @export
extract_links <- function(x, collapse = NULL, ...) {
  extract_html_tags(x, tag = "a", collapse = collapse, ...)
}

#' @rdname extract_html_tags
#'
#' @importFrom stringr str_locate_all str_sub
#'
#' @export
extract_reply_text <- function(x, collapse = "\n", ...) {
  if (grepl("</blockquote>", x)) {
    matches <- str_locate_all(x, "</blockquote>")
    chars <- sapply(matches, function(x) x[nrow(x), ])[1, ]
    extract_html_tags(
      str_sub(x, chars, nchar(x)),
      tag = "p", collapse = collapse, ...
    )
  }
  else {
    extract_html_tags(x, tag = "p", collapse = collapse, ...)
  }
}
