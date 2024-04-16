#### Workspace setup ####
library(tidyverse)

#### Import raw data ####
forest_data <- read_csv("forest_area_sum_2000_2020.csv")
ghg_data <- read_csv("ghg_emissions_sum_2000_2020.csv")
population_density_data <- read_csv("population_density_average_2000_2020.csv")

#### Clean data ####
# 清洗森林面积数据
clean_forest_data <-
  forest_data %>%
  filter(!is.na(total_forest_area)) %>%
  mutate(total_forest_area = as.numeric(total_forest_area)) %>%
  arrange(desc(total_forest_area))

# 清洗温室气体排放数据
clean_ghg_data <-
  ghg_data %>%
  filter(!is.na(total_ghg_emissions)) %>%
  mutate(total_ghg_emissions = as.numeric(total_ghg_emissions)) %>%
  arrange(desc(total_ghg_emissions))

# 清洗人口密度数据
clean_population_density_data <-
  population_density_data %>%
  filter(!is.na(average_population_density)) %>%
  mutate(average_population_density = as.numeric(average_population_density)) %>%
  arrange(desc(average_population_density))

#### Save cleaned data ####
write_csv(clean_forest_data, "cleaned_forest_data.csv")
write_csv(clean_ghg_data, "cleaned_ghg_data.csv")
write_csv(clean_population_density_data, "cleaned_population_density_data.csv")

