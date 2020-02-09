#' Iron March Data
#'
#' Contents of the SQL dump from _ironmarch.org_, a defunct neo-Nazi/white supremacist message board.
#'
#' * Data were acquired via the [Bellingcat](https://www.bellingcat.com/)-linked [iron_march_201911_archive.torrent](https://drive.google.com/file/d/1X4THLMV2Mf05hwR6Yw6IYVXhyVJt7yDg/view).
#' * The routine used to construct the MySQL database was adapted from [ThreeSixes/iron-march-leak-helper](https://github.com/ThreeSixes/iron-march-leak-helper).
#'
#' @format Each object is a `list()` of `data.table::data.table()`s.
#'
#' @source \url{https://www.bellingcat.com/resources/how-tos/2019/11/06/massive-white-supremacist-message-board-leak-how-to-access-and-interpret-the-data/}
#' 
#' @template author-bk
#' 
"im_core_dfs"

#' @rdname im_core_dfs
"im_orig_dfs"

#' @rdname im_core_dfs
"im_forums_dfs"

#' @rdname im_core_dfs
"im_other_dfs"