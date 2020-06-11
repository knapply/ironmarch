build_personnel <- function() {
  init <- list(
    list(
      name = "TheWeissewolfe",
      real_name = "Devon Arthurs",
      member_id = 9304L,
      affiliation = "International Third Positionist Federation, Atomwaffen",
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
      affiliation = "Atomwaffen",
      sources = "https://www.bellingcat.com/news/2019/12/19/transnational-white-terror-exposing-atomwaffen-and-the-iron-march-networks/"
    ),
    list(
      name = "The Yank",
      member_id = 6249L,
      aka = "Nordic_Wolf",
      real_name = "David Cole Tarkington",
      was_military = TRUE
      affiliation = "Atomwaffen",
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
    ),
    list(
      name = "With Hate As My Sword",
      member_id = 54L,
      real_name = "Lindsay Souvannarath",
      affiliation = "Atomwaffen", 
      sources = "https://www.vice.com/en_us/article/eve54j/the-woman-who-plotted-a-valentines-mass-murder-shares-how-the-internet-radicalized-her"
    ),
    list(
      name = "Ober",
      member_id = 13682L,
      real_name = "Matthew Urbanik",
      affiliation = "Atomwaffen"
    ),
    list(
      name = "Borovikov",
      member_id = 9960L,
      real_name = "Andrew Oneschuk", 
      affiliation = "Atomwaffen, Silver Legion"
    ),
    list(
      name = "Rekse_",
      member_id = 10133L,
      real_name = "Lauren Paul",
      aka = "schönundweiß",
      affiliation = "Atomwaffen, Silver Legion, American Vanguard, Aryan Underground"
    ),
    list(
      name = "Palmer",
      member_id = 274L,
      real_name = "Nathaniel D. Palmer",
      affiliation = "Atomwaffen"
    ),
    list(
      name = "Prussian Glory",
      member_id = 9655L,
      affiliation = "Atomwaffen"
    ),
    list(
      name = "EuropaUnited",
      member_id = 9648L,
      affiliation = "Atomwaffen"
    ),
    list(
      name = "SIEGE Engine",
      member_id = 9786L,
      affiliation = "Atomwaffen"
    ),
    list(
      name = "Atlas",
      member_id = 9174L,
      real_name = "Ryan Fleming",
      affiliation = "National Action"
    ),
    list(
      name = "Rockerz88",
      member_id = 7851L,
      real_name = "Zack Davies",
      affiliation = "National Action"
    ),
    list(
      name = "Daddy Terror", 
      member_id = 7L,
      real_name = "Benjamin Raymond",
      affiliation = "National Action"
    ),
    list(
      name = "ManyEnemiesBringsMuchHonor",
      member_id = 14231L,
      real_name = "Kieran Morris",
      affiliation = "Patriot Front"
    ),
    list(
      name = "Wolfman",
      member_id = 13308L,
      real_name = "William James Tschantre",
      affiliation = "Atomwaffen"
    ),
    list(
      name = "WadeAWD",
      member_id = 14349L,
      real_name = "Wade Mendisabal", 
      affiliation = "Atomwaffen"
    ),
    list(
      name = "Blood and Iron",
      member_id = 3L,
      real_name = "John Cartwright"
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
