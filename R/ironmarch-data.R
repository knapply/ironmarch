#' Iron March Data
#'
#' Contents of the SQL dump from _ironmarch.org_, a defunct neo-Nazi/white supremacist message board.
#'
#' * Data were acquired via the [Bellingcat](https://www.bellingcat.com/)-linked [iron_march_201911_archive.torrent](https://drive.google.com/file/d/1X4THLMV2Mf05hwR6Yw6IYVXhyVJt7yDg/view).
#'
#' @format Each object is a `list()` of `data.table::data.table()`s.
#'
#' @source \url{https://www.bellingcat.com/resources/how-tos/2019/11/06/massive-white-supremacist-message-board-leak-how-to-access-and-interpret-the-data/}
#' 
#' @template author-bk
#' 
#' @examples
#' library(data.table)
#' options(datatable.print.trunc.cols = TRUE)
#' 
#' length(im_core_dfs)
#' im_core_dfs$core_members
#' 
#' length(im_orig_dfs)
#' im_orig_dfs$orig_members
#' 
#' length(im_forums_dfs)
#' im_forums_dfs$forums_posts
#' 
#' length(im_other_dfs)
#' im_other_dfs$calendar_calendars
#' 
#' names(im_core_dfs)
#' 
#' names(im_orig_dfs)
#' 
#' names(im_forums_dfs)
#' 
#' names(im_other_dfs)
#' 
"im_core_dfs"

#' @rdname im_core_dfs
"im_orig_dfs"

#' @rdname im_core_dfs
"im_forums_dfs"

#' @rdname im_core_dfs
"im_other_dfs"
