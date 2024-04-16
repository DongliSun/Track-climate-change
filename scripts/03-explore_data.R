library(tidyverse)
library(knitr)  # 加载 knitr 包以使用 kable()

#### Load data ####
# 假设你已经正确加载了数据，并且确保数据的路径是正确的
forest_data <- read_csv("cleaned_forest_data.csv")
ghg_data <- read_csv("cleaned_ghg_data.csv")
population_data <- read_csv("cleaned_population_density_data.csv")

#### Explore data ####

# 1. Visualize forest coverage over time ##
forest_data %>%
  ggplot(aes(x = year, y = Forest_Coverage)) +  # 确保这里使用的是正确的列名
  geom_line() +
  labs(title = "Forest Coverage Over Time", x = "Year", y = "Coverage (%)")

# 2. Visualize GHG emissions over time ##
ghg_data %>%
  ggplot(aes(x = year, y = GHG_Emissions)) +  # 确保这里使用的是正确的列名
  geom_line(color = "red") +
  labs(title = "GHG Emissions Over Time", x = "Year", y = "Emissions (kt)")

# 3. Visualize population density over time ##
population_data %>%
  ggplot(aes(x = year, y = Population_Density)) +  # 确保这里使用的是正确的列名
  geom_line(color = "green") +
  labs(title = "Population Density Over Time", x = "Year", y = "Density (per km²)")

# 4. Summary statistics for all datasets ##
all_data <- bind_rows(
  forest_data %>% mutate(DataType = "Forest Coverage"),
  ghg_data %>% mutate(DataType = "GHG Emissions"),
  population_data %>% mutate(DataType = "Population Density")
)

all_data %>%
  group_by(DataType) %>%
  summarise(
    Mean = mean(Value, na.rm = TRUE),
    Median = median(Value, na.rm = TRUE),
    Min = min(Value, na.rm = TRUE),
    Max = max(Value, na.rm = TRUE)
  ) %>%
  pivot_wider(names_from = DataType, values_from = c(Mean, Median, Min, Max)) %>%
  kable()  # 使用 kable() 函数格式化表格输出

