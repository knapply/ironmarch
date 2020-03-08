# extract_chr <- function(parsed_html, tag, collapse = "\n") {
#   # if (!requireNamespace("xml2", quietly = TRUE)) {
#   #   stop("{xml2} is required for this functionality.", call. = FALSE)
#   # }
#   # if (!requireNamespace("rvest", quietly = TRUE)) {
#   #   stop("{rvest} is required for this functionality.", call. = FALSE)
#   # }
#   
#   tag <- match.arg(tag, c("p"))
#   
#   vapply(
#     parsed_html, function(.x) {
#       res <- xml2::xml_text(rvest::html_nodes(.x, tag))
#       if (length(res)) paste0(res, collapse = collapse) else NA_character_ 
#     },
#     FUN.VALUE = character(1L), USE.NAMES = FALSE
#   )
# }
# 
# 
# extract_list <- function(parsed_html, tag) {
#   # if (!requireNamespace("xml2", quietly = TRUE)) {
#   #   stop("{xml2} is required for this functionality.", call. = FALSE)
#   # }
#   # if (!requireNamespace("rvest", quietly = TRUE)) {
#   #   stop("{rvest} is required for this functionality.", call. = FALSE)
#   # }
#   
#   tag <- match.arg(tag, c("a"))
#   
#   lapply(parsed_html, function(.x) {
#     xml2::xml_text(rvest::html_nodes(.x, tag)) %||% NA_character_ 
#   })
# }
# 
# 
# extract_html_tags <- function(html, tag = c("p", "a"), collapse = "\n", ...) {
#   if (!requireNamespace("xml2", quietly = TRUE)) {
#     stop("{xml2} is required for this functionality.", call. = FALSE)
#   }
#   if (!requireNamespace("rvest", quietly = TRUE)) {
#     stop("{rvest} is required for this functionality.", call. = FALSE)
#   }
# 
#   rawified <- lapply(html, charToRaw)
#   parsed <- lapply(rawified, xml2::read_html)
#   
#   if (is.null(collapse)) {
#     lapply(
#       parsed, function(.x) {
#         res <- xml2::xml_text(rvest::html_nodes(.x, tag))
#         if (length(res)) res else NA_character_
#         })
# 
#   } else {
#     vapply(parsed, function(.x) {
#         res <- xml2::xml_text(rvest::html_nodes(.x, tag))
#         if (length(res)) paste0(res, collapse = collapse) else NA_character_ 
#       },
#       FUN.VALUE = character(1L), USE.NAMES = FALSE)
#   }
# }
# 
