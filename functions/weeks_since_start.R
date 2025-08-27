#' weeks_since_start
#' 
#' Finds the weeks since the initial observation from each row in a dataframe
#'
#' @param input_dataframe 
#'
#' @return weeks_since
#' @export none
#
#' @examples
#' weeks_since_start(bq1)
weeks_since <- c()
weeks_since_start <- function(input_dataframe) {
  for(i in seq_len(nrow(input_dataframe))){
    weeks_since[i] <- interval(start = input_dataframe[1, "sample_date"],
            end = input_dataframe[i, "sample_date"]) / lubridate::weeks(1)
  }
  return(weeks_since)
}


         
interval(start = as.date(1988),
         end = input_dataframe[i, "sample_date"]) / lubridate::weeks(1)