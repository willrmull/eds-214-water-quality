library(here)
library(janitor)
library(tidyverse)
library(lubridate)
source("moving_average.R")

#awefawefawef
bq1 <- read.csv(here::here("data", "knb-lter-luq.20.4923064", "QuebradaCuenca1-Bisley.csv")) %>%
  clean_names() %>%
  mutate(sample_id = case_when(
    sample_id == "Q1" ~ "BQ1")) 

bq1$year <- lubridate::year(ymd(bq1$sample_date))

seq(from = 0, to = 52.14, by = 4.5)

bq2 <- read.csv(here::here("data", "knb-lter-luq.20.4923064", "QuebradaCuenca1-Bisley.csv")) %>%
  clean_names() %>%
  mutate(sample_id = case_when(
    sample_id == "Q1" ~ "BQ2"))

bq3 <- read.csv(here::here("data", "knb-lter-luq.20.4923064", "QuebradaCuenca1-Bisley.csv")) %>%
  clean_names() %>%
  mutate(sample_id = case_when(
    sample_id == "Q1" ~ "BQ3"))

pmr <- read.csv(here::here("data", "knb-lter-luq.20.4923064", "RioMameyesPuenteRoto.csv")) %>%
  clean_names()  %>%
  mutate(sample_id = case_when(
    sample_id == "MPR" ~ "PRM"))

merged_data_frame <- rbind(bq1, bq2, bq3, pmr)
input_dataframe <- moving_average(bq1)

merged_data_frame$sample_date <- lubridate::as_date(ymd(merged_data_frame$sample_date))
merged_data_frame$year <- lubridate::year(merged_data_frame$sample_date)

clean_data_frame <- merged_data_frame %>% filter(1988 <= year & year <= 1994) %>%
  select(c("sample_id", "sample_date", "k", "no3_n", "mg", "ca", "nh4_n"))

clean_data_frame <- pivot_longer(clean_data_frame, cols = c("k", "no3_n", "mg", "ca", "nh4_n"), names_to = "Key", values_to = "Value") %>% na.omit()

clean_data_frame %>%
ggplot(aes(x = sample_date, y = Value, colour = sample_id)) +
  geom_line() +
  facet_wrap(~ Key)

