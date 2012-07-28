#' Clean Coordinates
#'
#' Cleans X and Y coordinates by imputing bad entries
#'
#' @param crime_data data.frame of crime records
#' @export
clean_coordinates <- function(crime_data) {
  crime_data <- clean_coordinates_XBLOCK(crime_data)
  crime_data <- clean_coordinates_YBLOCK(crime_data)

  crime_data
}
