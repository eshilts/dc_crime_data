#' Clean Crime Data
#'
#' Cleans crime data by cleaning or removing bad records
#'
#' @param crime_data data.frame of raw crime records
#' @param clean_data Keep cleaned up data? If not, drop cleaned records.
#' @return data.frame of cleaned records
#' @export
#' @examples
#' data(dc_crime_data_sample)
#' cleaned_data <- clean_crime_data(dc_crime_data_sample, clean_data=TRUE)
#' cleaned_data <- clean_crime_data(dc_crime_data_sample, clean_data=FALSE)
clean_crime_data <- function(crime_data, clean_data) {
  crime_data$record_cleaned <- FALSE

  crime_data <- clean_coordinates(crime_data)

  if(! clean_data) {
    crime_data <- crime_data[! crime_data$record_cleaned, ]
    crime_data$record_cleaned <- NULL
  }

  crime_data
}
