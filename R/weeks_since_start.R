#' weeks_since_start
#' 
#' Converts each observation in the date column into a week. The number of weeks 
#' Is equal to the weeks that passed between the observed date and the initial date
#'
#' @param input_dataframe 
#'
#' @return weeks_since
#' @export none
#
#' @examples
#' weeks_since_start(bq1)

# Create empty list
weeks_since <- c()
weeks_since_start <- function(input_dataframe) {
  # Iterates through each row 
  for(i in seq_len(nrow(input_dataframe))){
    # The interval function is used to convert each date into the number 
    # of weeks between the observed date and the inital date
    weeks_since[i] <- interval(start = input_dataframe[1, "sample_date"],
            end = input_dataframe[i, "sample_date"]) / lubridate::weeks(1)
  }
  # Return the list
  return(weeks_since)
}