#' @name iron-march-tables
#'
#' @title Iron March Data
#'
#' @description
#' Contents of the SQL dump from _ironmarch.org_, a defunct neo-Nazi/white supremacist message board.
#'
#' * Data were acquired via the [Bellingcat](https://www.bellingcat.com/)-linked [iron_march_201911_archive.torrent](https://drive.google.com/file/d/1X4THLMV2Mf05hwR6Yw6IYVXhyVJt7yDg/view).
#'
#' @format Each object is a `list()` of `tibble::tibble()`s.
#'
#' @source \url{https://www.bellingcat.com/resources/how-tos/2019/11/06/massive-white-supremacist-message-board-leak-how-to-access-and-interpret-the-data/}
#'
#' @template author-bk
NULL

#' @rdname iron-march-tables
#'
#' @examples
#' im_core_dfs
"im_core_dfs"

#' @rdname iron-march-tables
#'
#' @examples
#' im_orig_dfs
"im_orig_dfs"


#' @rdname iron-march-tables
#'
#' @examples
#' im_forums_dfs
"im_forums_dfs"

#' @rdname iron-march-tables
#'
#' @examples
#' im_other_dfs
"im_other_dfs"


#' @rdname iron-march-tables
#'
#' @examples
#' im_other_dfs
"combo_members_df"

#' @rdname iron-march-tables
#'
#' @examples
#' im_other_dfs
"combo_messages_df"



#' @name iron-march-entities
#'
#' @title Related Groups and People
#'
#' @description
#' Groups and People Associated with _ironmarch.org_ and/or its members.
#'
#' @template author-bk
NULL

#' @rdname iron-march-entities
#'
#' @template author-bk
#'
#' @examples
#' im_groups
"im_groups"

#' @rdname iron-march-entities
#'
#' @template author-bk
#'
#' @examples
#' im_personnel
"im_personnel"

#' @rdname iron-march-entities
#'
#' @template author-bk
#'
#' @examples
#' im_victims
"im_victims"

#' @name iron-march-events
#'
#' @title Events related (or of likely interest), to  _ironmarch.org_ members.
#'
#' @description
#' Events related (or of likely interest), to  _ironmarch.org_ members.
#'
#' @template author-an
#'
#' @examples
#' im_events
"im_events"

#' @name iron-march-third-party
#'
#' @template author-bk
#'
#' @title Data compiled by third parties.
#'
NULL

#' @rdname iron-march-third-party
#'
#' @source
#' * Bellingcat
#'   + `im_possible_mil_members`
#'   + [Possible Military Members (Google Sheets)](https://docs.google.com/spreadsheets/d/1mJfnYKqZdwPhK1bFbrx9hCi-61n5f0tener8iZ3AkOw/edit#gid=1584226573)
#'
#' @examples
#' im_possible_mil_members
"im_possible_mil_members"
