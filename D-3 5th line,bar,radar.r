# Required libraries
library(ggplot2)
library(reshape2)

# Data
data <- data.frame(
  Sector = c("Residential", "Commercial", "Industrial", "Transportation"),
  Q1 = c(5000, 8000, 9000, 4000),
  Q2 = c(6000, 7000, 9500, 4200),
  Q3 = c(7000, 6000, 10000, 4300),
  Q4 = c(6500, 7500, 9500, 4100)
)

# Reshape the data for radar plot
data_melted <- melt(data, id.vars = "Sector")

# 1. Line Plot
ggplot(data_melted, aes(x = variable, y = value, color = Sector, group = Sector)) +
  geom_line() +
  labs(title = "Energy Consumption by Sector Over Quarters",
       x = "Quarter",
       y = "Energy Consumption (kWh)",
       color = "Sector") +
  theme_minimal()

# 2. Bar Plot
ggplot(data_melted, aes(x = Sector, y = value, fill = variable)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Energy Consumption by Sector",
       x = "Sector",
       y = "Energy Consumption (kWh)",
       fill = "Quarter") +
  theme_minimal()

# 3. Radar Plot
ggplot(data_melted, aes(x = variable, y = value, group = Sector, color = Sector)) +
  geom_line() +
  geom_point() +
  coord_polar() +
  labs(title = "Energy Consumption by Quarter and Sector",
       x = NULL,
       y = "Energy Consumption (kWh)",
       color = "Sector") +
  theme_minimal()
