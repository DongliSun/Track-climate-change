# 加载必要的库
library(tidyverse)

# 设置模拟的年份数
years <- seq(2000, 2020)

# 生成基础数据
set.seed(123)  # 设置随机数种子以保证可重复性
data <- tibble(
  Year = years,
  GreenhouseGases = rnorm(length(years), mean = 1000, sd = 50),  # 假设的总温室气体排放量
  ForestArea = rnorm(length(years), mean = 3000, sd = 100),       # 假设的森林面积，单位千平方公里
  PopulationDensity = rnorm(length(years), mean = 50, sd = 10)   # 假设的人口密度，单位人/平方公里
)

# 简单的线性模型预测
# 假设总温室气体排放量每年增加5单位，森林面积每年减少10单位，人口密度每年增加0.3单位
data <- data %>%
  mutate(
    GreenhouseGases = GreenhouseGases + (Year - 2000) * 5,
    ForestArea = ForestArea - (Year - 2000) * 10,
    PopulationDensity = PopulationDensity + (Year - 2000) * 0.3
  )

# 输出数据
print(data)

# 可视化
data %>%
  ggplot(aes(x = Year)) +
  geom_line(aes(y = GreenhouseGases, color = "Greenhouse Gases")) +
  geom_line(aes(y = ForestArea, color = "Forest Area")) +
  geom_line(aes(y = PopulationDensity, color = "Population Density")) +
  scale_color_manual(values = c("Greenhouse Gases" = "red", "Forest Area" = "green", "Population Density" = "blue")) +
  labs(title = "Climate Change Simulation", y = "Value", color = "Variable")

