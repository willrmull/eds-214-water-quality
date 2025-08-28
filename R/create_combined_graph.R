#' create_combined_graph
#' 
#' This function takes in no arguments
#'
#' @return Returns a ggplot of five stacked graphs which has all been formatted
#' @export None
#'
#' @examples
#' create_combined_graph()
#' returns graph 
#' 

create_combined_graph <- function(merged_data_frame){
#K plot
k_plot <- ggplot(data = merged_data_frame, aes(x = date, y = rolling_mean_k, group = data_source, colour = data_source)) +
  geom_line() +
  labs(y = expression(paste("K mg ", I^{-1})),
       x = "Year",
       colour = "Data Source") +
  scale_x_date(date_breaks = "1 year",
               date_minor_breaks = "2 months",
               date_labels = "%Y") +
  scale_y_continuous(breaks = c( 0.4, 0.7, 1.0, 1.3, 1.6),
                     minor_breaks = c(0.55, .85, 1.15, 1.45),
                     limits = c(.4,1.6)) +
  scale_color_viridis(discrete = TRUE) + 
  theme(plot.margin = unit(c(0,0, 0.1,1), "cm")) + 
  theme_ipsum()
#no3_n Plot
no3_n_plot <-ggplot(data = merged_data_frame, aes(x = date, y = rolling_mean_no3_n, group = data_source, colour = data_source)) +
  geom_line() +
  labs(y = expression(paste(NO[3], "-N ug ", I^{-1})),
       x = "Year",
       colour = "Data Source") +
  scale_x_date(date_breaks = "1 year",
               date_minor_breaks = "2 months",
               date_labels = "%Y") +
  scale_y_continuous(breaks = c(100, 300, 500),
                     minor_breaks = c(200, 400),
                     limits = c(50, 500)) +
  scale_color_viridis(discrete = TRUE) + 
  theme(plot.margin = unit(c(0,0,.1,0), "cm")) + theme_ipsum()

#mg_plot
mg_plot <- ggplot(data = merged_data_frame, aes(x = date, y = rolling_mean_mg, group = data_source, colour = data_source)) +
  geom_line() +
  labs(y = expression(paste("Mg mg ", I^{-1})),
       x = "Year",
       colour = "Data Source") +
  scale_x_date(date_breaks = "1 year",
               date_minor_breaks = "2 months",
               date_labels = "%Y") +
  scale_y_continuous(breaks = c(1,2,3,4,5),
                     minor_breaks = c(.5,1.5,2.5,3.5,4.5),
                     limits = c(0, 5)) +
  scale_color_viridis(discrete = TRUE) + 
  theme(plot.margin = unit(c(0,0,0.1,0), "cm"))+ theme_ipsum()

#ca_plot
ca_plot <- ggplot(data = merged_data_frame, aes(x = date, y = rolling_mean_ca, group = data_source, colour = data_source)) +
  geom_line() +
  labs(y = expression(paste("Ca mg ", I^{-1})),
       x = "Year",
       colour = "Data Source") +
  scale_x_date(date_breaks = "1 year",
               date_minor_breaks = "2 months",
               date_labels = "%Y") +
  scale_y_continuous(breaks = c(0,2,4,6,8,10),
                     minor_breaks = c(1,3,5,7,9),
                     limits = c(0, 10)) +
  scale_color_viridis(discrete = TRUE) + 
  theme(plot.margin = unit(c(0,0,0.1,0), "cm")) + theme_ipsum()

#nh4_n_plot
nh4_n_plot <- ggplot(data = merged_data_frame, aes(x = date, y = rolling_mean_nh4_n, group = data_source, colour = data_source)) +
  geom_line() +
  labs(y = expression(paste(NH[4], "-N ug ", I^{-1})),
       x = "Year",
       colour = "Data Source") +
  scale_x_date(date_breaks = "1 year",
               date_minor_breaks = "2 months",
               date_labels = "%Y") +
  scale_y_continuous(breaks = c(0,20,40,60,80),
                     minor_breaks = c(10,30,50,70),
                     limits = c(0, 80)) + 
  scale_color_viridis(discrete = TRUE) + 
  theme(plot.margin = unit(c(0,0,0.1,0), "cm")) + theme_ipsum()

merged_plots <- (k_plot / no3_n_plot / mg_plot / ca_plot / nh4_n_plot) 
merged_plots + plot_layout(axes = "collect", guides = "collect") & 
  theme(plot.margin = unit(c(0.1,0.1,0.1,0.1), "cm"), 
        axis.title.x = element_text(hjust = 0.5, size = 15))
return(merged_plots)
}
