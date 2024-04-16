# 确认数据集的列名
print(names(forest_data))
print(names(ghg_data))
print(names(population_data))

# 如果列名正确，尝试绘图
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

