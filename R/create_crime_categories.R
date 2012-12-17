#' Create Crime Categories
#'
#' Creates crime categorical variables from the raw crime data
#'
#' @param crime_data data.frame of raw crime data
#' @return data.frame with additional variables derived from the type of crime
#' @export
create_date_variables <- function(crime_data) {
  crime_data$non_violent_theft <- crime_data$OFFENSE %in% c("BURGLARY", "THEFT", "THEFT F/AUTO", "STOLEN AUTO")
  crime_data$violent_crime <- crime_data$OFFENSE %in% c("ROBBERY", "HOMICIDE", "SEX ABUSE", "ADW")

  crime_data
}
