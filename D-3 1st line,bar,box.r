# Load necessary libraries
library(ggplot2)
library(reshape2)

# Create data frame with the provided data
data <- data.frame(
  Product = c('Product X', 'Product Y', 'Product Z', 'Product W'),
  Warehouse_A = c(200, 150, 300, 100),
  Warehouse_B = c(150, 100, 250, 150),
  Warehouse_C = c(100, 50, 200, 200)
)

# Melt the data frame to have a tidy format for plotting
data_melted <- melt(data, id.vars = 'Product', variable.name = 'Warehouse', value.name = 'Inventory')

# Generate Line Plot
line_plot <- ggplot(data_melted, aes(x = Product, y = Inventory, color = Warehouse)) +
  geom_line() +
  geom_point() +
  labs(title = 'Product Inventory Levels', x = 'Product', y = 'Inventory', color = 'Warehouse') +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_color_brewer(palette = 'Set1') +
  theme_minimal()

# Describe inventory with a Bar plot
bar_plot <- ggplot(data_melted, aes(x = Product, y = Inventory, fill = Warehouse)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  labs(title = 'Product Inventory Levels', x = 'Product', y = 'Inventory', fill = 'Warehouse') +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  theme_minimal()

# Visualize inventory levels with box plot
box_plot <- ggplot(data_melted, aes(x = Product, y = Inventory)) +
  geom_boxplot() +
  labs(title = 'Product Inventory Levels', x = 'Product', y = 'Inventory') +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  theme_minimal()

# Display the plots
print(line_plot)
print(bar_plot)
print(box_plot)
