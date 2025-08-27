
ggplot(data = merged_data_frame, aes(x = date, y = rolling_mean_k, group = Source, colour = Source)) +
  geom_line() +
  scale_x_continuous()
ggplot(data = bq1_cleaned, aes(x = date, y = rolling_mean_k)) +
  geom_line()
