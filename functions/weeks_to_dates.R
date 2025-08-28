#' weeks_to_dates
#' 
#' Converts the weeks columns, which represents the weeks between the initial observation and 
#' when the measurement was taken), and converts it back into a standard date. 
#'
#' @param input_dataframe 
#'
#' @return The input data frame with an additional column containing dates
#' @export
#'
#' @examples input_data frame(bq1_cleaned)
weeks_to_dates <- function(input_dataframe) {
  # The initial date of observation
  start_date <- as.Date("1988-1-1") 

  # Iterates through each row of the data frame and converts it back to a standard date
  # by adding week value to start_date
  for(i in 1:nrow(input_dataframe)){
    input_dataframe[i, "date"] <- start_date + weeks(as.integer(input_dataframe[i, "week"]))
  }
  # Returns data frame
  return(input_dataframe)
}
