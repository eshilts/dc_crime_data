#' Clean Coordinates YBLOCK
#'
#' Cleans the coordinates for the YBLOCK field
#'
#' @param crime_data data.frame of crime records
#' @return data.frame with cleaned YBLOCK field
#' @export
clean_coordinates_YBLOCK <- function(crime_data) {
  # One record appears to be an order of magnitude too large with a 4 and 7 transposed
  crime_data$record_cleaned[crime_data$YBLOCK > 1740000] <- TRUE
  crime_data$YBLOCK[crime_data$YBLOCK > 1740000] <- as.numeric(sub('174', '147', crime_data$YBLOCK[crime_data$YBLOCK > 1740000])) / 10

  crime_data
}
