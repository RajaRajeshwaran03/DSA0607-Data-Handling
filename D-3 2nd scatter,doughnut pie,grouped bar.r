# Load necessary libraries
library(ggplot2)
library(tidyr)
library(dplyr)

# Create data frame with the provided data
data <- data.frame(
  Year = c(2019, 2020, 2021, 2022),
  City_A = c(1200, 1150, 1230, 1180),
  City_B = c(800, 850, 870, 900),
  City_C = c(900, 950, 990, 950)
)

# Melt the data frame to have a tidy format for plotting
data_melted <- melt(data, id.vars = 'Year', variable.name = 'City', value.name = 'Rainfall')

# Generate Scatter Plot
scatter_plot <- ggplot(data_melted, aes(x = Year, y = Rainfall, color = City)) +
  geom_point() +
  labs(title = 'Annual Rainfall', x = 'Year', y = 'Rainfall (mm)', color = 'City') +
  theme_minimal()

# Calculate total rainfall for each city
total_rainfall <- data %>%
  gather(key = "City", value = "Rainfall", -Year) %>%
  group_by(City) %>%
  summarise(Total_Rainfall = sum(Rainfall))

# Calculate percentage of total rainfall for each city
total_rainfall$Percentage <- round((total_rainfall$Total_Rainfall / sum(total_rainfall$Total_Rainfall)) * 100, 1)

# Describe with a Doughnut Pie plot
doughnut_pie_plot <- ggplot(total_rainfall, aes(x = "", y = Total_Rainfall, fill = City)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  labs(title = "Total Annual Rainfall by City", fill = "City", y = "") +
  theme_void() +
  geom_text(aes(label = paste0(Total_Rainfall, "mm\n", Percentage, "%")), position = position_stack(vjust = 0.5))

# Visualize with Grouped Bar plot
grouped_bar_plot <- ggplot(data_melted, aes(x = Year, y = Rainfall, fill = City)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  labs(title = 'Annual Rainfall', x = 'Year', y = 'Rainfall (mm)', fill = 'City') +
  theme_minimal()

# Display the plots
print(scatter_plot)
print(doughnut_pie_plot)
print(grouped_bar_plot)
