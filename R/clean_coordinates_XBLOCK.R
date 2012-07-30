#' Clean Coordinates XBLOCK
#'
#' Cleans the coordinates for the XBLOCK field
#'
#' @param crime_data data.frame of crime records
#' @return data.frame with cleaned XBLOCK field
#' @export
clean_coordinates_XBLOCK <- function(crime_data) {
  # XBLOCK coordinates that appear to be 2 orders of magnitude too high
  crime_data$record_cleaned[crime_data$XBLOCK > 40000000] <- TRUE 
  crime_data$XBLOCK[crime_data$XBLOCK > 40000000] <- crime_data$XBLOCK[crime_data$XBLOCK > 40000000] / 100

  # XBLOCK coordinates that appear to be an order of magnitude too low
  crime_data$record_cleaned[crime_data$XBLOCK > 39000 & crime_data$XBLOCK < 41000] <- TRUE 
  crime_data$XBLOCK[crime_data$XBLOCK > 39000 & crime_data$XBLOCK < 41000] <- crime_data$XBLOCK[crime_data$XBLOCK > 39000 & crime_data$XBLOCK < 41000] * 10

  crime_data
}
