#### Preamble ####
# Purpose: Simulates the desired data.
# Author: Dongli SUn
# Data: 16 April 2024
# Contact: dongli.sun@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to know where to get Children Vocabulary Development data.
# Any other information needed? None.


#### Workspace setup ####
library(tidyverse)

# simulate the year
years <- seq(2000, 2020)

# simulate data
set.seed(123)  
data <- tibble(
  Year = years,
  GreenhouseGases = rnorm(length(years), mean = 1000, sd = 50),  # Hypothetical total greenhouse gas emissions
  ForestArea = rnorm(length(years), mean = 3000, sd = 100),       # Hypothetical forest area in thousands of square kilometers
  PopulationDensity = rnorm(length(years), mean = 50, sd = 10)   # Assumed population density in units of people per square kilometer
)

# Simple linear model prediction
# Assume that total greenhouse gas emissions increase by 5 units per year, forest area decreases by 10 units per year, and population density increases by 0.3 units per year
data <- data %>%
  mutate(
    GreenhouseGases = GreenhouseGases + (Year - 2000) * 5,
    ForestArea = ForestArea - (Year - 2000) * 10,
    PopulationDensity = PopulationDensity + (Year - 2000) * 0.3
  )

# Output data
print(data)

# visualization
data %>%
  ggplot(aes(x = Year)) +
  geom_line(aes(y = GreenhouseGases, color = "Greenhouse Gases")) +
  geom_line(aes(y = ForestArea, color = "Forest Area")) +
  geom_line(aes(y = PopulationDensity, color = "Population Density")) +
  scale_color_manual(values = c("Greenhouse Gases" = "red", "Forest Area" = "green", "Population Density" = "blue")) +
  labs(title = "Climate Change Simulation", y = "Value", color = "Variable")

