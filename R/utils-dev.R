# # .dev_mode <-  function() {
#   assignInNamespace("print.data.table",
#                     function(x, ...) {
#                       cat("\t\t\t*** actual class: data.table ***", "\n")
#                       print(tibble::as_tibble(x), ...)
#                     },
#                     ns = "data.table")
# # }
