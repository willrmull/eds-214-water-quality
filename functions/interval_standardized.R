#' Interval Organizing
#' 
#' This function groups together data by the week they were located in
#'
#' @param input_dataframe 
#'
#' @return A dataframe containing moving averages of variables
#' @export
#'
#' @examples
interval_standardized <- function(input_dataframe) {
  seq_interval <- seq(from = 4.5, 
                      to = max(input_dataframe$weeks_since), 
                      by = 4.5)
  
  rolling_means_df <- data.frame(matrix(NA, nrow = 0, ncol = 0))
  target_columns <- c("k", "no3_n", "mg", "ca", "nh4_n")
  
  rolling_means_df[]
  
  for(col_name in target_columns){
    if (col_name %in% colnames(input_dataframe)){
      for(i in 1:length(seq_interval)) {
        lower <- seq_interval[i] - 4.5
        upper <- seq_interval[i] + 4.5
        
        interval_data <- input_dataframe %>% 
          filter(lower <= input_dataframe$weeks_since &
                   input_dataframe$weeks_since <= upper, na.rm = TRUE)
        
        rolling_means_df[i, paste0("rolling_mean_", col_name)] <- 
          mean(interval_data[, col_name], na.rm = TRUE) 
      }
    }
  }
  rolling_means_df$week <- seq_interval
  return(rolling_means_df)
}
