# source: https://docs.google.com/spreadsheets/d/1mJfnYKqZdwPhK1bFbrx9hCi-61n5f0tener8iZ3AkOw/edit#gid=1584226573
# Bellingcat
print.data.table <- function(x) print(tibble::as_tibble(x))

init <- data.table::fread(
  "inst/bellingcat/Possible Military Members - Conversations.csv"
)

# styler: off
init[, `Convo No.` := NULL
     ][, msg_date := as.POSIXct(msg_date, origin = "1970-01-01")
       ]
# styler: on

im_possible_mil_members <- tibble::as_tibble(init)
usethis::use_data(im_possible_mil_members, overwrite = TRUE)
