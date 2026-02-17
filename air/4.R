load('air.RData')

air <- filter(air, county == 'OR - Baker') |>
  arrange(desc(emissions))

save(air, file = '4.RData')
