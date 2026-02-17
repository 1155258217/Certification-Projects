load('air.RData')

air <- filter(air, county == 'OR - Baker')
save(air, file = '3.RData')
