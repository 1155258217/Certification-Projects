calculate_growth_rate <- function(years, visitors) {
  return ((visitors[length(visitors)] - visitors[1])/(max(years) - min(years)))
}

predict_visitors <- function(years, visitors, year) {
  return (visitors[length(visitors)] + calculate_growth_rate(years, visitors)*(year - max(years)))
}

visitors <- read.csv("visitors.csv")
year <- as.integer(readline("Year: "))
predicted_visitors <- predict_visitors(visitors$year, visitors$visitors, year)
cat(paste0(predicted_visitors, " million visitors\n"))
