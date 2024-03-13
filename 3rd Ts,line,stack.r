
library(ggplot2)
library(tidyr)
data <- data.frame(
  Date = c("01/01/2024", "02/01/2024", "03/01/2024", "04/01/2024", "05/01/2024", "06/01/2024"),
  Station_A_Temperature = c(25.0, 24.5, 26.2, 23.8, 25.5, 23.0),
  Station_A_Precipitation = c(0.1, 0.0, 0.3, 0.2, 0.1, 0.4),
  Station_B_Temperature = c(23.5, 22.8, 25.0, 22.5, 24.5, 21.8),
  Station_B_Precipitation = c(0.2, 0.3, 0.1, 0.0, 0.4, 0.2)
)

data_long <- pivot_longer(data, cols = -Date, names_to = c("Station", "Variable"), names_sep = "_")
ggplot(data_long, aes(x = as.Date(Date, format = "%d/%m/%Y"), y = value, color = Variable)) +
  geom_line() +
  labs(title = "Time Series of Temperature and Precipitation",
       x = "Date", y = "Value", color = "Variable") +
  theme_minimal()

ggplot(data_long, aes(x = as.Date(Date, format = "%d/%m/%Y"), y = value, color = Variable, linetype = Station)) +
  geom_line() +
  labs(title = "Line Plot of Temperature and Precipitation",
       x = "Date", y = "Value", color = "Variable", linetype = "Station") +
  theme_minimal()

ggplot(data_long, aes(x = as.Date(Date, format = "%d/%m/%Y"), y = value, fill = Variable)) +
  geom_bar(stat = "identity") +
  labs(title = "Stacked Bar Plot of Temperature and Precipitation",
       x = "Date", y = "Value", fill = "Variable") +
  theme_minimal()
