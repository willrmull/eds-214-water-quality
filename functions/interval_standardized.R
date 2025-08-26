
seq_interval <- data_frame()
interval_standardized <- function(input_dataframe) {
  seq_interval <- seq(from = 4.5, to = max(input_dataframe$weeks_since), by = 4.5)
  for(col_name in colnames(input_dataframe)) {
    if (col_name %in% c("k", "no3_n", "mg", "ca", "nh4_n")) {
      for(i in seq_interval) {
        seq_interval[i, colname] <- input_dataframe %>% 
          filter(input_dataframe
    }
    }
  }
}
interval_standardized(bq1)
