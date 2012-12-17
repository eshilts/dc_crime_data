#' Create Pretty Labels
#'
#' Creates labels that are nice for plotting
#'
#' @param crime_data data.frame of raw crime data
#' @return data.frame with additional label variables
#' @export
create_date_variables <- function(crime_data) {
  crime_data$label_ward <- sprintf("Ward %s", crime_data$WARD)
  crime_data$label_offense <- capwords(crime_data$OFFENSE)
  crime_data$label_district <- capwords(crime_data$DISTRICT)

  crime_data
}
