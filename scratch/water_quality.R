library(here)
library(janitor)
library(tidyverse)
library(lubridate)
library(paletteer)

source("functions/interval_standardized.R")
source("functions/weeks_since_start.R")
source("functions/weeks_to_dates.R")

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

#Add column containing how many weeks have passed since the initial observation 
bq1$weeks_since <- weeks_since_start(bq1)
bq2$weeks_since <- weeks_since_start(bq2)
bq3$weeks_since <- weeks_since_start(bq3)
pmr$weeks_since <- weeks_since_start(pmr)


bq1_cleaned <- interval_standardized(bq1)
bq2_cleaned <- interval_standardized(bq2)
bq3_cleaned <- interval_standardized(bq3)
pmr_cleaned <- interval_standardized(pmr)

bq1_cleaned <- weeks_to_dates(bq1_cleaned)
bq2_cleaned <- weeks_to_dates(bq2_cleaned)
bq3_cleaned <- weeks_to_dates(bq3_cleaned)
pmr_cleaned <- weeks_to_dates(pmr_cleaned)

merged_data_frame <- bind_rows(bq1_cleaned, bq2_cleaned, bq3_cleaned, pmr_cleaned, .id = "Source")

clean_data_frame <- merged_data_frame %>%
  select(c("date", "Source", "rolling_mean_k", "rolling_mean_no3_n", "rolling_mean_mg", "rolling_mean_ca", "rolling_mean_nh4_n"))

clean_data_frame <- pivot_longer(clean_data_frame, cols = c("rolling_mean_k", "rolling_mean_no3_n", "rolling_mean_mg", "rolling_mean_ca", "rolling_mean_nh4_n"), names_to = "Key", values_to = "Value")
    

ggplot(data = clean_data_frame, aes(x = date, y = Value, colour = Source)) +
  geom_line() +
  facet_wrap(~ Key, scales = "free")

