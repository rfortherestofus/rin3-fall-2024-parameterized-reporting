library(tidyverse)
library(palmerpenguins)
library(quarto)

# quarto_render(
#   input = "report.qmd",
#   output_file = "torgersen.html",
#   execute_params = list(
#     island = "Torgersen"
#   )
# )

islands <-
  penguins |>
  distinct(island) |>
  mutate(island = as.character(island)) |>
  pull(island)

# islands <- c("Biscoe", "Dream", "Torgersen")

reports <- tibble(
  input = "report.qmd",
  output_file = str_glue("{islands}.html"),
  execute_params = map(islands, ~ list(island = .))
)

pwalk(reports, quarto_render)
