# Required library
library(ggplot2)

# Data
data <- data.frame(
  Month = c("January", "February", "March", "April"),
  Facebook = c(12000, 12500, 13000, 13500),
  Instagram = c(15000, 15500, 16000, 16500),
  Twitter = c(8000, 8200, 8400, 8600)
)

# Reshape the data for line plot
data_long <- reshape2::melt(data, id.vars = "Month")

# 1. Stacked Bar Plot
ggplot(data, aes(x = Month)) +
  geom_bar(aes(y = Facebook, fill = "Facebook"), stat = "identity") +
  geom_bar(aes(y = Instagram, fill = "Instagram"), stat = "identity") +
  geom_bar(aes(y = Twitter, fill = "Twitter"), stat = "identity") +
  scale_fill_manual(values = c("Facebook" = "#1F77B4", "Instagram" = "#FF7F0E", "Twitter" = "#2CA02C")) +
  labs(title = "Social Media Followers Over Months",
       x = "Month",
       y = "Followers",
       fill = "Platform") +
  theme_minimal()

# 2. Histogram Plot
ggplot(data = data_long, aes(x = value, fill = variable)) +
  geom_histogram(binwidth = 500, position = "identity", alpha = 0.7, color = "black") +
  labs(title = "Histogram of Social Media Followers",
       x = "Followers",
       y = "Frequency",
       fill = "Platform") +
  facet_wrap(~variable, scales = "free") +
  theme_minimal()

# 3. Line Plot
ggplot(data_long, aes(x = Month, y = value, color = variable, group = variable)) +
  geom_line() +
  labs(title = "Social Media Followers Over Months",
       x = "Month",
       y = "Followers",
       color = "Platform") +
  scale_color_manual(values = c("Facebook" = "#1F77B4", "Instagram" = "#FF7F0E", "Twitter" = "#2CA02C")) +
  theme_minimal()
