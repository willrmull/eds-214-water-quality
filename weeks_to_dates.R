weeks_to_dates <- function(input_dataframe) {
  start_date <- as.Date("1988-1-1") 
  
  date_storage <- c()
  
  for(i in 1:nrow(input_dataframe)){
    input_dataframe[i, "date"] <- start_date + weeks(as.integer(input_dataframe[i, "week"]))
  }
  return(input_dataframe)
}
