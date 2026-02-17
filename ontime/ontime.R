bus <- read.csv('bus.csv')
rail <- read.csv('rail.csv')
route <- readline('Choose a route: ')

if (route %in% bus$route){
  filtered_bus <- bus[bus$route == route, ]
  peak <- filtered_bus$peak == 'PEAK'
  reliability_peak <- paste0(as.character(round(mean(filtered_bus$numerator[peak]/filtered_bus$denominator[peak],na.rm=TRUE)*100)),'%')
  off_peak <- filtered_bus$peak == 'OFF_PEAK'
  reliability_offpeak <- paste0(as.character(round(mean(filtered_bus$numerator[off_peak]/filtered_bus$denominator[off_peak],na.rm=TRUE)*100)),'%')
  print(paste0('peak: ', reliability_peak))
  print(paste0('off-peak: ', reliability_offpeak))
}else if (route %in% rail$route){
  filtered_rail <- rail[rail$route == route, ]
  peak <- filtered_rail$peak == 'PEAK'
  reliability_peak <- paste0(as.character(round(mean(filtered_rail$numerator[peak]/filtered_rail$denominator[peak],na.rm=TRUE)*100)),'%')
  off_peak <- filtered_rail$peak == 'OFF_PEAK'
  reliability_offpeak <- paste0(as.character(round(mean(filtered_rail$numerator[off_peak]/filtered_rail$denominator[off_peak],na.rm=TRUE)*100)),'%')
  print(paste0('peak: ', reliability_peak))
  print(paste0('off-peak: ', reliability_offpeak))
}else {
  print('This route is invalid.')
}
