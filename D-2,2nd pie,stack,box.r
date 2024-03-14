# Load required libraries
library(ggplot2)

# Create the dataframe
data <- data.frame(
  "Customer ID" = c(1, 2, 3),
  "Age" = c(28, 35, 42),
  "Gender" = c("Female", "Male", "Female"),
  "Income" = c(50000, 60000, 75000)
)

# 1. Pie Chart for Gender
pie_chart_gender <- ggplot(data, aes(x = "", fill = Gender)) +
  geom_bar(width = 1) +
  coord_polar("y", start = 0) +
  ggtitle("Gender Distribution") +
  theme_void() +
  theme(legend.position = "right")

# 2. Stacked Bar Plot for Age and Gender
stacked_bar_plot <- ggplot(data, aes(x = Gender, fill = cut(Age, breaks = c(20, 30, 40, 50), labels = c("20-30", "30-40", "40-50")))) +
  geom_bar(position = "stack") +
  ggtitle("Age Distribution by Gender") +
  xlab("Gender") +
  ylab("Count")

# 3. Box Plot for Income by Gender
box_plot_income <- ggplot(data, aes(x = Gender, y = Income, fill = Gender)) +
  geom_boxplot() +
  ggtitle("Income Distribution by Gender") +
  xlab("Gender") +
  ylab("Income ($)")

# Print the plots
print(pie_chart_gender)
print(stacked_bar_plot)
print(box_plot_income)
