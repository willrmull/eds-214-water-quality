#' roll_mean
#'
#' @param input_dataframe 
#'
#' @return A data frame containing rolling means of five different columns calculated 
#'         in 9 week intervals
#' @export
#'
#' @examples 
#' roll_mean(bq1)

roll_mean <- function(input_dataframe) {
  # Create sequence which counts from 4.5 to the highest week recorded by
  # in intervals of 4.5
  seq_interval <- seq(from = 4.5, 
                      to = max(input_dataframe$weeks_since), 
                      by = 4.5)
  
  # Initialize data frame results will be stored in
  rolling_means_df <- data.frame(matrix(NA, nrow = 0, ncol = 0))
  target_columns <- c("k", "no3_n", "mg", "ca", "nh4_n") # Variables of interest
  
  # Iterate through columns of interest
  for(col_name in target_columns){ 
    if (col_name %in% colnames(input_dataframe)){
      # Runs for as many 4.5 week intervals there are in the data set
      for(i in 1:length(seq_interval)) {
        # Specify the interval of acceptable values in each loop
        lower <- seq_interval[i] - 4.5
        upper <- seq_interval[i] + 4.5
        
        # Create a subset of the input data frame with weeks located in upper
        # and lower bounds specified above.
        # This lets a 9 week interval be subset every time this loop runs
        interval_data <- input_dataframe %>% 
          filter(lower <= input_dataframe$weeks_since &
                   input_dataframe$weeks_since <= upper, na.rm = TRUE)
        
        # Find the mean value of a variable of interest within the subset
        # data frame
        # Means are placed into appropriate columns using the column name
        rolling_means_df[i, paste0("rolling_mean_", col_name)] <- 
          mean(interval_data[, col_name], na.rm = TRUE) 
      }
    }
  }
  # Append a new column containing the seq interval and return
  # the data frame
  rolling_means_df$week <- seq_interval
  return(rolling_means_df)
}
