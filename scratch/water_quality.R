#Install Required Packages
library(here)
library(janitor)
library(tidyverse)
library(lubridate)
library(patchwork)
library(hrbrthemes)
library(viridis)
library(paletteer)

# Load functions 
source("functions/roll_mean.R")
source("functions/weeks_since_start.R")
source("functions/weeks_to_dates.R")
source("functions/create_combined_graph.R")

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                                                            --
##------------------------------- READ IN FILES---------------------------------
##                                                                            --
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# Reading in each file and creating a subset of the data we are interested in 
bq1 <- read.csv(here::here("data", "knb-lter-luq.20.4923064", "QuebradaCuenca1-Bisley.csv")) %>%
  clean_names() %>%
  mutate(sample_id = case_when(
    sample_id == "Q1" ~ "BQ1")) %>% 
 mutate(year = lubridate::year(sample_date)) %>% 
filter(1988 <= year & year <= 1994)

bq2 <- read.csv(here::here("data", "knb-lter-luq.20.4923064", "QuebradaCuenca2-Bisley.csv")) %>%
  clean_names() %>%
  mutate(sample_id = case_when(
    sample_id == "Q2" ~ "BQ2")) %>% 
  mutate(year = lubridate::year(sample_date)) %>% 
  filter(1988 <= year & year <= 1994)

bq3 <- read.csv(here::here("data", "knb-lter-luq.20.4923064", "QuebradaCuenca3-Bisley.csv")) %>%
  clean_names() %>%
  mutate(sample_id = case_when(
    sample_id == "Q1" ~ "BQ3")) %>% 
  mutate(year = lubridate::year(sample_date)) %>% 
  filter(1988 <= year & year <= 1994)

pmr <- read.csv(here::here("data", "knb-lter-luq.20.4923064", "RioMameyesPuenteRoto.csv")) %>%
  clean_names()  %>%
  mutate(sample_id = case_when(
    sample_id == "MPR" ~ "PRM")) %>% 
  mutate(year = lubridate::year(sample_date)) %>% 
  filter(1988 <= year & year <= 1994)

# The weeks_since_start function copies the input data frame and adds 
# a new column containing the number of weeks that have passed since the initial
# observation
bq1$weeks_since <- weeks_since_start(bq1)
bq2$weeks_since <- weeks_since_start(bq2)
bq3$weeks_since <- weeks_since_start(bq3)
pmr$weeks_since <- weeks_since_start(pmr)

# The roll_mean functions calculates the rolling mean of five columns of 
# interest in 9 week windows. Returns a data frame containing those rolling means
# and the weeks since the start
bq1_cleaned <- roll_mean(bq1)
bq2_cleaned <- roll_mean(bq2)
bq3_cleaned <- roll_mean(bq3)
pmr_cleaned <- roll_mean(pmr)

# The rolling_mean function converts column containing weeks since the start
# back into a standard date format.
bq1_cleaned <- weeks_to_dates(bq1_cleaned)
bq2_cleaned <- weeks_to_dates(bq2_cleaned)
bq3_cleaned <- weeks_to_dates(bq3_cleaned)
pmr_cleaned <- weeks_to_dates(pmr_cleaned)

# Data frames are merged by binding rows. An ID column is added to 
# distinguish the data frames. The IDs are then changed to have proper
# identifiers
merged_data_frame <- bind_rows(bq1_cleaned, bq2_cleaned, bq3_cleaned, pmr_cleaned, .id = "data_source") %>%
  mutate(data_source = case_when(
    data_source == 1 ~ "BQ1",
    data_source == 2 ~ "BQ2",
    data_source == 3 ~ "BQ3",
    data_source == 4 ~ "PRM"
  ))

# Runs the testing file
merged_plots <- create_combined_graph() + plot_layout(axes = "collect", guides = "collect") & 
  theme(plot.margin = unit(c(0.1,0.1,0.1,0.1), "cm"), 
        axis.title.x = element_text(hjust = 0.5, size = 15))
merged_plots

ggsave(plot = merged_plots, here::here("figs", "merged_plots.jpg"), width = 6, height = 4)
