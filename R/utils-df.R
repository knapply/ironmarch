.finalize_df <- function(x, as_tibble) {
  if (!as_tibble || !requireNamespace("tibble", quietly = TRUE)) {
    return(x)
  }
  
  if (isTRUE(class(x) == "list")) {
    by_cols <- setdiff(names(x[[1L]]), "which_df")
    lapply(x, function(.x) tibble::as.tibble(unique(.x, by = by_cols)))
    
  } else {
    tibble::as_tibble(x)
    
  } 
}
