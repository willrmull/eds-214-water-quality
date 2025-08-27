new_df <- data.frame()

moving_average <- function(input_dataframe) {
  for(col_name in colnames(input_dataframe)) {
    if (col_name %in% c("k", "no3_n", "mg", "ca", "nh4_n")) {
      for(i in seq_len(nrow(input_dataframe))) {
        new_df[i, col_name] <- mean(input_dataframe[(), col_name], na.rm = TRUE)
      }
    }
  }
  return(new_df)
}
