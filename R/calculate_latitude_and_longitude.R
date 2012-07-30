#' Calculate Latitude and Longitude
#'
#' Calculates latitude and longitude from XBLOCK AND YBLOCK coordinates.
#' The coordinates are given in the NAD 83 projection, Maryland state plane,
#' with units in meters. Documentation for this calculation can be found in the
#' README file.
#'
#' @param crime_data data.frame of crime records
#' @return data.frame with two additional columns, latitude and longitude, with units in the standard GPS format
#' @export
calculate_latitude_and_longitude <- function(crime_data) {
  xy_coords <- crime_data[, c('XBLOCK', 'YBLOCK')]

  coordinates(xy_coords) <- c('XBLOCK', 'YBLOCK')

  # NAD83, maryland state plane, units in meters
  proj4string(xy_coords) <- CRS("+init=esri:102285") 
  # Transform to latitude and longitude for GPS
  xy_coords <- spTransform(xy_coords, CRS("+init=epsg:4326")) 

  xy_coords <- as.data.frame(xy_coords)
  names(xy_coords) <- c('longitude', 'latitude')

  crime_data <- cbind(crime_data, xy_coords)
  
  crime_data
}
