build_events <- function() {
  init <- list(
    paris_2015 = list(
      name = "November 2015 Paris attacks",
      category = "attack",
      date = as.Date("2015-11-13"),
      start_time = as.POSIXct("2015-11-13 19:16:00", tzone = "UTC")
    )
    ,
    norway_2011 = list(
      name = "2011 Norway attack",
      category = "attack",
      date = as.Date("2011-07-22")
    )
    ,
    sandy_hook = list(
      name = "Sandy Hook",
      category = "attack",
      date = as.Date("2012-12-14")
    )
    ,
    vegas = list(
      name = "Las Vegas Shooting",
      category = "attack",
      date = as.Date("2017-10-01"),
      start_time = as.POSIXct("2017-10-01 22:05:00", tz = "PST")
    )
    ,
    pulse = list(
      name = "Pulse Nightclub Shooting",
      category = "attack",
      date = as.Date("2016-06-12"),
      start_time = as.POSIXct("2016-06-12 02:02:00", tz = "EDT")
    )
    ,
    san_bernadino = list(
      name = "San Bernadino attack",
      category = "attack",
      date = as.Date("2012-12-02"),
      start_time = as.POSIXct("2012-12-02 10:58:00", tz = "PST")
    )
    ,
    santa_barbara = list(
      name = "Isla Vista killings",
      category = "attack",
      date = as.Date("2014-05-23"),
      start_time = as.POSIXct("2014-05-23 21:27:00", tz = "PST")
    )
  )
  
  out <- data.table::rbindlist(init, fill = TRUE)
  tibble::as_tibble(out)
}

im_events <- build_events()
usethis::use_data(im_events, overwrite = TRUE)
