library(here)
library(janitor)
library(tidyverse)
library(lubridate)
source("functions/moving_average.R")
source("functions/weeks_since_start.R")

#aiuehfoaerhfgoaibngf
bq1 <- read.csv(here::here("data", "knb-lter-luq.20.4923064", "QuebradaCuenca1-Bisley.csv")) %>%
  clean_names() %>%
  mutate(sample_id = case_when(
    sample_id == "Q1" ~ "BQ1")) %>% 
 mutate(year = lubridate::year(sample_date)) %>% 
filter(1988 <= year & year <= 1994)

#Add column containing how many weeks have passed since the initial observation 
bq1$weeks_since <- weeks_since_start(bq1)

bq2 <- read.csv(here::here("data", "knb-lter-luq.20.4923064", "QuebradaCuenca1-Bisley.csv")) %>%
  clean_names() %>%
  mutate(sample_id = case_when(
    sample_id == "Q1" ~ "BQ2")) %>% 
  mutate(year = lubridate::year(sample_date)) %>% 
  filter(1988 <= year & year <= 1994)

bq2$weeks_since <- weeks_since_start(bq2)

bq3 <- read.csv(here::here("data", "knb-lter-luq.20.4923064", "QuebradaCuenca1-Bisley.csv")) %>%
  clean_names() %>%
  mutate(sample_id = case_when(
    sample_id == "Q1" ~ "BQ3")) %>% 
  mutate(year = lubridate::year(sample_date)) %>% 
  filter(1988 <= year & year <= 1994)

bq3$weeks_since <- weeks_since_start(bq3)

pmr <- read.csv(here::here("data", "knb-lter-luq.20.4923064", "RioMameyesPuenteRoto.csv")) %>%
  clean_names()  %>%
  mutate(sample_id = case_when(
    sample_id == "MPR" ~ "PRM")) %>% 
  mutate(year = lubridate::year(sample_date)) %>% 
  filter(1988 <= year & year <= 1994)

pmr$weeks_since <- weeks_since_start(pmr)






merged_data_frame <- rbind(bq1, bq2, bq3, pmr)

merged_data_frame$sample_date <- lubridate::as_date(ymd(merged_data_frame$sample_date))
merged_data_frame$year <- lubridate::year(merged_data_frame$sample_date)

clean_data_frame <- merged_data_frame %>% filter(1988 <= year & year <= 1994) %>%
  select(c("sample_id", "sample_date", "k", "no3_n", "mg", "ca", "nh4_n"))

clean_data_frame <- pivot_longer(clean_data_frame, cols = c("k", "no3_n", "mg", "ca", "nh4_n"), names_to = "Key", values_to = "Value") %>% na.omit()

clean_data_frame %>%
ggplot(aes(x = sample_date, y = Value, colour = sample_id)) +
  geom_line() +
  facet_wrap(~ Key)

