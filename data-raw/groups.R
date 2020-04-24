build_groups <- function() {
  init <- list(
    list(
      name = "Atomwaffen Division",
      aka = "Atomwaffen,AW"
    ),
    list(
      name = "International Third Positionist Federation",
      aka = "ITP"
    ),
    list(
      name = "Nordic Resistance Movement",
      aka = "NMR"
    ),
    list(
      name = "National Democratic Party of Germany",
      aka = "NPD"
    ),
    list(
      name = "Golden Dawn"
    ),
    list(
      name = "Gromada",
      aka = "Community Movement"
    ),
    list(
      name = "Young Russian Socialist Avantgarde",
      aka = "MARS"
    ),
    list(
      name = "National Action"
    ),
    list(
      name = "American Vanguard",
      aka = "American Reaction"
    ),
    list(
      name = "Traditionalist Workers Party"
    ),
    list(
      name = "Silver Legion"
    ),
    list(
      name = "Azov Battalion",
      aka = 'Special Operations Detachment "Azov",Azov Regiment,Azov Detachment'
    ),
    list(
      name = "Feuerkrieg Division"
    ),
    list(
      name = "Generation WAR"
    ),
    list(
      name = "Vorherrschaft Division",
      aka = "VSD"
    ),
    list(
      name = "Aryan Underground"
    )
  )

  out <- data.table::rbindlist(init, fill = TRUE)

  list_cols <- c("aka")
  if (length(list_cols)) {
    # styler: off
    out[, (list_cols) := lapply(.SD, strsplit, ","),
      .SDcols = list_cols]
    # styler:on
  }

  tibble::as_tibble(out)
}

im_groups <- tibble::as_tibble(build_groups())
usethis::use_data(im_groups, overwrite = TRUE)
