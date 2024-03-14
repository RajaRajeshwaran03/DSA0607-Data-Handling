library(ggplot2)

# Create DataFrame for given dataset
data <- data.frame(
  SCHOOL = rep(LETTERS[1:4], each=3),
  GRADE_LEVEL = rep(paste('Grade', 1:3), times=4),
  NUMBER_OF_STUDENTS = c(25, 30, 20, 22, 28, 18, 20, 25, 15, 28, 32, 24)
)

# Mosaic Plot
mosaicplot(table(data$SCHOOL, data$GRADE_LEVEL), main='Mosaic Plot')

# Histogram Plot
hist(data$NUMBER_OF_STUDENTS, main='Histogram Plot', xlab='Number of Students', ylab='Frequency')

# Scatter Plot
ggplot(data, aes(x=SCHOOL, y=NUMBER_OF_STUDENTS)) + 
  geom_point() +
  labs(title='Scatter Plot', x='School', y='Number of Students')