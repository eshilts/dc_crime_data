#' Create Date Variables
#'
#' Creates date variables from the raw crime data
#'
#' @param crime_data data.frame of raw crime data
#' @return data.frame with additional variables derived from the date
#' @export
create_date_variables <- function(crime_data) {
  crime_data$date <- as.Date(gsub(" .*", "", crime_data$REPORT_DAT), format='%m/%d/%Y')
  crime_data$year <- format(crime_data$date, format='%Y')
  crime_data$month <- format(crime_data$date, format='%B')
  crime_data$quarter <- as.character(ceiling(crime_data$month %% 3))

  crime_data$year_month <- sprintf("%s-%s", crime_data$year, format(crime_data$date, '%b'))
  crime_data$year_quarter <- sprintf("%s-Q%s", crime_data$year, crime_data$quarter)

  crime_data
}
