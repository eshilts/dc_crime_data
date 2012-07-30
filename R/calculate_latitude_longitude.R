#' Calculate Latitude and Longitude
#'
#' Calculates latitude and longitude from XBLOCK AND YBLOCK coordinates.
#' The coordinates are given in the NAD 83 projection, Maryland state plane,
#' with units in meters. Documentation for this calculation can be found in the
#' README.
#'
#' @param crime_data data.frame of crime records
#' @return data.frame with two additional columns, latitude and longitude, with units in the standard GPS format
#' @export
calculate_latitude_longitude <- function(crime_data) {
  xy_coords <- crime_data[, c('XBLOCK', 'YBLOCK')]

  coordinates(xy_coords) <- c('XBLOCK', 'YBLOCK')
  proj4string(xy_coords) <- CRS("+init=esri:102285") # NAD83, maryland state plane, units in meters
  xy_coords <- spTransform(xy_coords, CRS("+init=epsg:4326")) # Latitude and longitude for GPS

  xy_coords <- as.data.frame(xy_coords)
  names(xy_coords) <- c('longitude', 'latitude')

  crime_data <- cbind(crime_data, xy_coords)
  
  crime_data
}
