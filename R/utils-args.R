check_summarize_and_split <- function(summarize, split) {
  if (summarize && split) {
    warning("`split` ignored.", 
            "\n\t- `summarize` is `TRUE` and `split` is `TRUE`",
            "\n\t- If you want to enable `split`, set `summarize` as `FALSE`",
            call. = FALSE)
  }
}