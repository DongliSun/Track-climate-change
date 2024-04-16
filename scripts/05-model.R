#### Preamble ####
# Purpose: Model the effects of various factors on climate-related environmental indicators.
# Author: ChatGPT
# Date: 17 April 2023
# Contact: chatgpt@openai.com
# License: MIT
# Pre-requisites: Simulated data for climate change factors.
# Any other information needed? None.

#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(modelsummary)

#### Simulate data ####
set.seed(123)
climate_data <- tibble(
  co2_emissions = rnorm(100, mean = 400, sd = 50),  # CO2 emissions in ppm
  forest_coverage = rnorm(100, mean = 30, sd = 5),  # Forest coverage in percentage
  population_density = rnorm(100, mean = 100, sd = 20),  # Population density per square km
  temperature_change = co2_emissions * 0.05 + forest_coverage * -0.1 + population_density * 0.01 + rnorm(100, mean = 0, sd = 0.5)  # Simulated temperature change in Celsius
)

#### Model data ####
# Linear regression to explore the impact of CO2 emissions, forest coverage, and population density on temperature change
climate_model <- lm(
  temperature_change ~ co2_emissions + forest_coverage + population_density,
  data = climate_data
)

# Model summary
summary(climate_model)
modelsummary(climate_model)

#### Visualize relationships ####
# Plot the relationships
ggplot(climate_data, aes(x = co2_emissions, y = temperature_change)) +
  geom_point() +
  geom_smooth(method = "lm", color = "blue") +
  labs(title = "Impact of CO2 Emissions on Temperature Change", x = "CO2 Emissions (ppm)", y = "Temperature Change (°C)")

ggplot(climate_data, aes(x = forest_coverage, y = temperature_change)) +
  geom_point() +
  geom_smooth(method = "lm", color = "green") +
  labs(title = "Impact of Forest Coverage on Temperature Change", x = "Forest Coverage (%)", y = "Temperature Change (°C)")

ggplot(climate_data, aes(x = population_density, y = temperature_change)) +
  geom_point() +
  geom_smooth(method = "lm", color = "red") +
  labs(title = "Impact of Population Density on Temperature Change", x = "Population Density (per km²)", y = "Temperature Change (°C)")

#### Save model ####
saveRDS(climate_model, file = "outputs/models/climate_change_model.rds")

