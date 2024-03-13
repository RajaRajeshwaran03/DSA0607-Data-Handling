library(ggplot2)
data <- data.frame(
  Month = c("Jan", "Feb", "March", "April", "May", "Jun", "July", "August", "Sep", "Oct", "Nov", "Dec"),
  Economic_Condition = c("Good", "Good", "Good", "Good", "Fair", "Fair", "Good", "Bad", "Fair", "Good", "Bad", "Fair"),
  Unemployment_Rate = c(10.7, 9.8, 10.2, 11.2, 15.75, 17.8, 19.4, 25.6, 18.6, 15.6, 26.7, 19.5)
)
ggplot(data, aes(x = Month, y = Unemployment_Rate, fill = Economic_Condition)) +
  geom_bar(stat = "identity") +
  labs(title = "Stacked Bar Plot of Economic Condition vs Unemployment Rate",
       x = "Month", y = "Unemployment Rate") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_manual(values = c("Good" = "blue", "Fair" = "green", "Bad" = "red"))
ggplot(data, aes(x = "", fill = Economic_Condition)) +
  geom_bar(width = 1) +
  coord_polar("y") +
  labs(title = "Pie Plot of Economic Condition",
       fill = "Economic Condition") +
  theme_void()
ggplot(data, aes(x = Month, y = Unemployment_Rate, fill = Economic_Condition)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Grouped Bar Plot of Economic Condition vs Unemployment Rate",
       x = "Month", y = "Unemployment Rate", fill = "Economic Condition") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


