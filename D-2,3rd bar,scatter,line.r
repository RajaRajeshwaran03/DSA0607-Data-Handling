# Load required libraries
library(ggplot2)

# Create the dataframe
data <- data.frame(
  "State" = c("Tamilnadu", "Kerala", "Karnataka", "Andrapradesh", "Telangana"),
  "Male" = c(2000000, 1000000, 1500000, 1200000, 1000000),
  "Female" = c(1500000, 2000000, 2500000, 1600000, 1300000),
  "Above 18" = c(3000000, 2000000, 2500000, 1800000, 2000000),
  "Total" = c(6000000, 5000000, 5000000, 4500000, 2500000)
)

# 1. Bar Plot for Population
bar_plot_population <- ggplot(data, aes(x = State, y = Total)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  ggtitle("Population by State") +
  xlab("State") +
  ylab("Population")

# 2. Scatter Plot for Population
scatter_plot_population <- ggplot(data, aes(x = State, y = Total)) +
  geom_point(color = "red", size = 3) +
  ggtitle("Population by State") +
  xlab("State") +
  ylab("Population") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# 3. Line Plot for Population
line_plot_population <- ggplot(data, aes(x = State, y = Total, group = 1)) +
  geom_line(color = "blue") +
  geom_point(color = "blue") +
  ggtitle("Population by State") +
  xlab("State") +
  ylab("Population") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Print the plots
print(bar_plot_population)
print(scatter_plot_population)
print(line_plot_population)
