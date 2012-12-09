#' Load Crime Data by Ward
#'
#' Loads crime data by ward
#'
#' @param clean_data should the data be cleaned? If not, messy data are dropped.
#' @export
#' @examples
#' dc_crime_data <- load_crime_data_by_ward(clean_data=TRUE)
#' stopifnot(nrow(dc_crime_data) > 1)
#' dc_crime_data <- load_crime_data_by_ward(clean_data=FALSE)
#' stopifnot(nrow(dc_crime_data) > 1)
load_crime_data_by_ward <- function(clean_data=TRUE) {
  ward_files <- grep('ward', list.files(path=system.file(package='dccrimedata', 'data'), full.names=TRUE), 
                     ignore.case=TRUE, value=TRUE)

  load_ward_data <- function(ward_file)
    read.csv(file=ward_file, stringsAsFactors=FALSE)

  combined_data <- data.frame()

  for(ward_file in ward_files)
    combined_data <- rbind(combined_data, load_ward_data(ward_file))

  combined_data <- clean_crime_data(combined_data, clean_data)

  combined_data <- convert_nad83_to_latitude_and_longitude(combined_data)

  combined_data <- create_date_variables(combined_data)

  combined_data
}
