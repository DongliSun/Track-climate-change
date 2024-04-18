#### Preamble ####
# Purpose: To make the data clean and organize
# Author: Dongli Sun
# Data: 16 April 2024
# Contact: dongli.sun@mail.utoronto.ca
# License: MIT
# Pre-requisites: get the csv from download_data
# Any other information needed? None.

# Confirm the column names of the dataset
print(names(forest_data))
print(names(ghg_data))
print(names(population_data))

# If the column names are correct, try drawing
forest_data %>%
  ggplot(aes(x = year, y = total_forest_area)) +
  geom_line() +
  labs(title = "Forest Coverage Over Time", x = "Year", y = "Coverage (%)")

ghg_data %>%
  ggplot(aes(x = year, y = total_ghg_emissions)) +
  geom_line(color = "red") +
  labs(title = "GHG Emissions Over Time", x = "Year", y = "Emissions (kt)")

population_data %>%
  ggplot(aes(x = year, y = average_population_density)) +
  geom_line(color = "green") +
  labs(title = "Population Density Over Time", x = "Year", y = "Density (per km²)")

