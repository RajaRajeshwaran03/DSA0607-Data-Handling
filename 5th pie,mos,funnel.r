# Most Common Jobs by State Dataset
jobs_data <- data.frame(
  Year = c(2019, 2020, 2022, 2023, 2024),
  Job_Sector = c("IT", "Government Job", "Customer care", "Bank", "Games"),
  Job_Seekers_Rate = c(95, 97, 98, 82, 74),
  Selection_Rate = c(25, 12, 45, 20, 35)
)

percentages <- round(jobs_data$Job_Seekers_Rate/sum(jobs_data$Job_Seekers_Rate)*100,1)
labels <- paste(jobs_data$Job_Sector, "(", percentages, "%)", sep = "")
# 1.Pie Chart
pie(jobs_data$Job_Seekers_Rate, labels = labels,
    main = "Distribution of Job Seekers by Job Sector",
    col = rainbow(length(jobs_data$Job_Seekers_Rate)))


# 2. Mosaic Plot
mosaicplot(table(jobs_data$Year, jobs_data$Job_Sector),
           main = "Mosaic Plot of Job Sectors by Year",
           xlab = "Year",
           ylab = "Job Sector")

# 3. Funnel Plot
ggplot(jobs_data, aes(x = Job_Sector, y = Selection_Rate)) +
  geom_col(fill = "skyblue") +
  coord_flip() +
  labs(title = "Selection Rate by Job Sector",
       x = "Job Sector",
       y = "Selection Rate")