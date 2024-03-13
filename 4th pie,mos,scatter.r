# Internet Users by Browser Dataset
internet_data <- data.frame(
  Year = c(2019, 2020, 2022, 2023, 2024),
  Browser = c("Chrome", "Chrome", "Chrome", "Chrome", "Chrome"),
  Users = c(22.7, 25.8, 28.7, 30.5, 35.2)
)
percentages <- round(internet_data$Users / sum(internet_data$Users) * 100, 1)
labels <- paste(internet_data$Browser, "(", percentages, "%)", sep = "")

# Pie Chart
pie(internet_data$Users, labels = labels,
    main = "Distribution of Internet Users by Browser",
    col = rainbow(length(internet_data$Users)))


# 2. Mosaic Plot
mosaicplot(table(internet_data$Year, internet_data$Browser),
           main = "Mosaic Plot of Internet Users by Year and Browser",
           xlab = "Year",
           ylab = "Browser")

# 3. Scatter Plot
plot(internet_data$Year, internet_data$Users,
     main = "Internet Users by Browser Over Time",
     xlab = "Year",
     ylab = "Users",
     col = "blue")