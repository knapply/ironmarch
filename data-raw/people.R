build_personnel <- function() {
  init <- list(
    list(
      name = "TheWeissewolfe",
      real_name = "Devon Arthurs",
      member_id = 9304L,
      affiliation = "International Third Positionist Federation",
      sources = "https://www.bellingcat.com/news/2019/12/19/transnational-white-terror-exposing-atomwaffen-and-the-iron-march-networks/"
    ),
    list(
      name = "Woman in Black",
      member_id = 9L,
      affiliation = "International Third Positionist Federation",
      sources = "https://www.bellingcat.com/news/2019/12/19/transnational-white-terror-exposing-atomwaffen-and-the-iron-march-networks/"
    ),
    list(
      name = "Mr. Elegy",
      member_id = 8L,
      affiliation = "International Third Positionist Federation",
      sources = "https://www.bellingcat.com/news/2019/12/19/transnational-white-terror-exposing-atomwaffen-and-the-iron-march-networks/"
    ),
    list(
      name = "Figlio di Moros",
      member_id = 37L,
      affiliation = "International Third Positionist Federation",
      sources = "https://www.bellingcat.com/news/2019/12/19/transnational-white-terror-exposing-atomwaffen-and-the-iron-march-networks/"
    ),
    list(
      name = "Александр Славрос",
      member_id = 1L,
      aka = "Slavros, Moi Mir",
      possible_aka = "Alisher Mukhitdinov",
      sources = "https://www.bellingcat.com/news/2019/12/19/transnational-white-terror-exposing-atomwaffen-and-the-iron-march-networks/"
    ),
    list(
      name = "Odin",
      member_id = 7600L,
      real_name = "Brandon Russel",
      was_military = TRUE,
      sources = "https://www.bellingcat.com/news/2019/12/19/transnational-white-terror-exposing-atomwaffen-and-the-iron-march-networks/"
    ),
    list(
      name = "The Yank",
      member_id = 6249L,
      sources = "https://www.bellingcat.com/news/2019/12/19/transnational-white-terror-exposing-atomwaffen-and-the-iron-march-networks/"
    ),
    list(
      name = "Arathis",
      member_id = 9869L,
      affiliation = "Attomwaffen",
      sources = "https://www.bellingcat.com/news/2019/12/19/transnational-white-terror-exposing-atomwaffen-and-the-iron-march-networks/"
    ),
    list(
      name = "Stealth_24",
      member_id = 13092L,
      affiliation = "Attomwaffen",
      sources = "https://www.bellingcat.com/news/2019/12/19/transnational-white-terror-exposing-atomwaffen-and-the-iron-march-networks/"
    ),
    list(
      real_name = "Nicholas Giampas",
      affiliation = "Attomwaffen",
      sources = "https://www.bellingcat.com/news/2019/12/19/transnational-white-terror-exposing-atomwaffen-and-the-iron-march-networks/"
    ),
    list(
      real_name = "Samuel Woodward",
      affiliation = "Attomwaffen",
      sources = "https://www.bellingcat.com/news/2019/12/19/transnational-white-terror-exposing-atomwaffen-and-the-iron-march-networks/"
    ),
    list(
      real_name = "Edward Clark",
      affiliation = "Attomwaffen",
      sources = "https://www.bellingcat.com/news/2019/12/19/transnational-white-terror-exposing-atomwaffen-and-the-iron-march-networks/"
    ),
    list(
      real_name = "Benjamin Bogard",
      affiliation = "Attomwaffen",
      sources = "https://www.bellingcat.com/news/2019/12/19/transnational-white-terror-exposing-atomwaffen-and-the-iron-march-networks/"
    ),
    list(
      real_name = "Andrew Thomasburg",
      affiliation = "Attomwaffen",
      sources = "https://www.bellingcat.com/news/2019/12/19/transnational-white-terror-exposing-atomwaffen-and-the-iron-march-networks/"
    ),
    list(
      real_name = "Jarrett William Smith",
      affiliation = "Attomwaffen",
      sources = "https://www.bellingcat.com/news/2019/12/19/transnational-white-terror-exposing-atomwaffen-and-the-iron-march-networks/"
    ),
    list(
      name = "Úlfhédnar",
      member_id = 13024L,
      was_military = TRUE
    ),
    list(
      real_name = "Matt Heimbach",
      affiliation = "Traditionalist Workers Party",
      sources = "https://www.bellingcat.com/news/2019/12/19/transnational-white-terror-exposing-atomwaffen-and-the-iron-march-networks/"
    ),
    list(
      name = "Werwolf",
      member_id = 14133L,
      real_name = "Timothy Wilson",
      affiliation = "Attomwaffen",
      sources = "https://www.vice.com/en_us/article/g5xnem/man-who-planned-to-bomb-hospital-fighting-coronavirus-dies-in-in"
    ),
    list(
      real_name = "Andrew Thomasberg",
      affiliation = "Attomwaffen"
    ),
    list(
      real_name = "Benjamin Bogard",
      affiliation = "Attomwaffen"
    ),
    list(
      real_name = "Jeffrey Clark",
      affiliation = "Attomwaffen"
    ),
    list(
      real_name = "Vasillios Pistolis",
      affiliation = "Attomwaffen"
    ),
    list(
      real_name = "Conor Climo",
      was_military = TRUE
    ),
    list(
      real_name = "John Denton",
      affiliation = "Attomwaffen"
    ),
    list(
      real_name = "Johnny Garza",
      affiliation = "Attomwaffen"
    ),
    list(
      real_name = "Cameron Shea",
      affiliation = "Attomwaffen"
    ),
    list(
      real_name = "Taylor Parker-Dipeppe",
      affiliation = "Attomwaffen"
    ),
    list(
      name = "the_Khimære",
      member_id = 14028L,
      real_name = "Kaleb Cole",
      affiliation = "Attomwaffen"
    ),
    list(
      name = "Rape",
      member_id == 13353L,
      real_name = "David Cole Tarkington",
      was_military = TRUE,
      aka = "therelentlessagony",
      affiliation = "Attomwaffen",
      sources = "https://gizmodo.com/leak-exposes-u-s-navy-sailor-as-once-prolific-recruite-1841149776"
    )

    # ,
    # list(
    #   real_name = "",
    #   affiliation = "Attomwaffen"
    # )
  )

  out <- data.table::rbindlist(init, fill = TRUE)
  cols_to_split <- c("aka", "affiliation", "sources")
  if (length(cols_to_split)) {
    # styler: off
    out[, (cols_to_split) := lapply(.SD, strsplit, ","),
        .SDcols = cols_to_split]
    # styler: on
  }

  tibble::as_tibble(out)
}

build_victims <- function() {
  init <- list(
    list(
      real_name = "Blaze Bernstein",
      connected_personnel = "Samuel Woodward",
      note = "killed by Samuel Woodward"
    )
  )
  cols_to_split <- NULL
  if (length(cols_to_split)) {
    # styler: off
    out[, (cols_to_split) := lapply(.SD, strsplit, ","),
        .SDcols = cols_to_split]
    # styler: on
  }
  out <- data.table::rbindlist(init, fill = TRUE)
}


im_personnel <- build_personnel()
usethis::use_data(im_personnel, overwrite = TRUE)
im_victims <- build_victims()
usethis::use_data(im_victims, overwrite = TRUE)
