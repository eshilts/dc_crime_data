#' Load Crime Data by Ward
#'
#' Loads crime data by ward
#'
#' @export
#' @examples
#' dc_crime_data <- load_crime_data_by_ward()
load_crime_data_by_ward <- function() {
  ward_files <- grep('ward', list.files(path=system.file(package='dccrimedata', 'data'), full.names=TRUE), 
                     ignore.case=TRUE, value=TRUE)

  load_ward_data <- function(ward_file)
    read.csv(file=ward_file, stringsAsFactors=FALSE)

  combined_data <- data.frame()

  for(ward_file in ward_files) {
    print(ward_file)
    combined_data <- rbind(combined_data, load_ward_data(ward_file))
  }

  combined_data
}
