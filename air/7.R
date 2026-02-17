load('air.RData')

air <- air |>
  select(c(level_1, pollutant, emissions)) |>
  rename(source = level_1) |>
  group_by(source, pollutant)

air <- air |>
  summarize(emissions = sum(emissions, na.rm=TRUE)) |>
  arrange(source, pollutant)

save(air, file = '7.RData')
