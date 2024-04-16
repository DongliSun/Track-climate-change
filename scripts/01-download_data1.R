#### Workspace setup ####
library(tidyverse)
library(WDI)

#### Download data ####
# Download forest area data for all countries from 2000 to 2020
forest_data <- WDI(indicator = 'AG.LND.FRST.ZS', start = 2000, end = 2020)

# Download greenhouse gas emissions data for all countries from 2000 to 2020
ghg_data <- WDI(indicator = 'EN.ATM.GHGT.KT.CE', start = 2000, end = 2020)

# Download population density data for all countries from 2000 to 2020
population_density_data <- WDI(indicator = 'EN.POP.DNST', start = 2000, end = 2020)

#### Process data ####
# Process forest data to get a sum of forest area for each year across all countries
forest_sum <- forest_data %>%
  group_by(year) %>%
  summarize(total_forest_area = sum(AG.LND.FRST.ZS, na.rm = TRUE))

# Process GHG data to get a sum of GHG emissions for each year across all countries
ghg_sum <- ghg_data %>%
  group_by(year) %>%
  summarize(total_ghg_emissions = sum(EN.ATM.GHGT.KT.CE, na.rm = TRUE))

# Process population density data to get the average density for each year across all countries
population_density_sum <- population_density_data %>%
  group_by(year) %>%
  summarize(average_population_density = mean(EN.POP.DNST, na.rm = TRUE))

#### Save data ####
# Save the processed data to CSV files
write_csv(forest_sum, "forest_area_sum_2000_2020.csv")
write_csv(ghg_sum, "ghg_emissions_sum_2000_2020.csv")
write_csv(population_density_sum, "population_density_average_2000_2020.csv")

