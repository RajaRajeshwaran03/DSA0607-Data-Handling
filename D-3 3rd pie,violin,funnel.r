# Load necessary library
library(ggplot2)

# Data
years <- c(2019, 2020, 2021, 2022)
undergraduate <- c(15000, 15200, 15500, 15800)
postgraduate <- c(5000, 5100, 5200, 5300)
international <- c(3000, 3200, 3300, 3400)

# 1. Pie Plot for 2022
enrollment_data <- data.frame(Category = c("Undergraduate", "Postgraduate", "International"),
                              Count = c(15800, 5300, 3400))
pie_plot <- ggplot(enrollment_data, aes(x = "", y = Count, fill = Category)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  theme_void() +
  theme(legend.position = "right") +
  labs(title = "University Enrollment Distribution for 2022",
       fill = "Category",
       y = "Enrollment Count")

print(pie_plot)

# 2. Violin Plot for Enrollment Over Years
enrollment_df <- data.frame(Year = rep(years, each = 3),
                            Enrollment = c(undergraduate, postgraduate, international),
                            Category = rep(c("Undergraduate", "Postgraduate", "International"), times = 4))

violin_plot <- ggplot(enrollment_df, aes(x = factor(Category), y = Enrollment, fill = Category)) +
  geom_violin(trim = FALSE) +
  scale_fill_manual(values = c("#ff9999", "#66b3ff", "#99ff99")) +
  labs(title = "Enrollment Distribution Over Years",
       x = "Category",
       y = "Enrollment Count")

print(violin_plot)

# 3. Funnel Plot for Enrollment Over Years
funnel_plot <- ggplot(enrollment_df, aes(x = Year, y = Enrollment, color = Category)) +
  geom_line() +
  geom_point() +
  labs(title = "Enrollment Over Years",
       x = "Year",
       y = "Enrollment Count",
       color = "Category")

print(funnel_plot)
