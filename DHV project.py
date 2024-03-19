#1
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load the dataset with appropriate encoding
superstore_data = pd.read_csv("/content/drive/MyDrive/superstore_final_dataset (1).csv", encoding='latin-1')

# A. Visualize the Product details with their Product ID and Product Name
product_details = superstore_data[['Product_ID', 'Product_Name']].drop_duplicates()
print("Product Details:")
print(product_details)

# B. Visualize the High-Selling and Low-Selling Products by Product_ID
product_sales = superstore_data.groupby('Product_ID')['Sales'].sum().reset_index()
high_selling_products = product_sales.nlargest(10, 'Sales')
low_selling_products = product_sales.nsmallest(10, 'Sales')

plt.figure(figsize=(12, 6))
plt.bar(high_selling_products['Product_ID'], high_selling_products['Sales'], color='green', label='High-Selling Products')
plt.bar(low_selling_products['Product_ID'], low_selling_products['Sales'], color='red', label='Low-Selling Products')
plt.xlabel('Product ID')
plt.ylabel('Total Sales')
plt.title('High-Selling and Low-Selling Products')
plt.legend()
plt.xticks(rotation=45)
plt.show()

# C. Year wise visualize the sales details
superstore_data['Order_Date'] = pd.to_datetime(superstore_data['Order_Date'])
superstore_data['Year'] = superstore_data['Order_Date'].dt.year
yearly_sales = superstore_data.groupby('Year')['Sales'].sum().reset_index()

plt.figure(figsize=(10, 6))
sns.barplot(x='Year', y='Sales', data=yearly_sales)
plt.xlabel('Year')
plt.ylabel('Total Sales')
plt.title('Yearly Sales Details')
plt.show()

# D. Region wise visualize the sales details
region_sales = superstore_data.groupby('Region')['Sales'].sum().reset_index()

plt.figure(figsize=(10, 6))
sns.barplot(x='Region', y='Sales', data=region_sales)
plt.xlabel('Region')
plt.ylabel('Total Sales')
plt.title('Region-wise Sales Details')
plt.show()

# E. Category and Sub-category wise visualize the sales
category_sales = superstore_data.groupby(['Category', 'Sub_Category'])['Sales'].sum().reset_index()

plt.figure(figsize=(12, 8))
sns.barplot(x='Sales', y='Sub_Category', hue='Category', data=category_sales)
plt.xlabel('Total Sales')
plt.ylabel('Sub-Category')
plt.title('Category and Sub-category wise Sales')
plt.show()

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load the dataset with appropriate encoding
superstore_data = pd.read_csv("/content/drive/MyDrive/superstore_final_dataset (1).csv", encoding='latin-1')

# 2. Customer Analysis

# A. Visualize the customer data year-wise
superstore_data['Order_Date'] = pd.to_datetime(superstore_data['Order_Date'])
superstore_data['Year'] = superstore_data['Order_Date'].dt.year
customer_yearly_data = superstore_data.groupby(['Customer_ID', 'Year']).size().reset_index(name='count')

plt.figure(figsize=(10, 6))
sns.countplot(x='Year', data=customer_yearly_data)
plt.xlabel('Year')
plt.ylabel('Number of Orders')
plt.title('Customer Data Year-wise')
plt.show()

# B. Visualize regular customers based on their purchases
customer_purchases = superstore_data.groupby('Customer_ID')['Order_ID'].nunique().reset_index(name='Num_of_Orders')
regular_customers = customer_purchases[customer_purchases['Num_of_Orders'] > 1]

plt.figure(figsize=(10, 6))
sns.histplot(regular_customers['Num_of_Orders'], bins=20, kde=False)
plt.xlabel('Number of Orders')
plt.ylabel('Number of Customers')
plt.title('Regular Customers Based on Purchases')
plt.show()

# C. Visualize customer-wise top-selling product
customer_top_product = superstore_data.groupby(['Customer_ID', 'Product_Name']).size().reset_index(name='count')
customer_top_product = customer_top_product.sort_values(by='count', ascending=False).groupby('Customer_ID').head(1)

plt.figure(figsize=(12, 8))
sns.barplot(x='count', y='Product_Name', data=customer_top_product.head(10))
plt.xlabel('Count')
plt.ylabel('Product Name')
plt.title('Top-Selling Product for Each Customer')
plt.show()

# D. Visualize year-wise top-selling product
yearly_top_product = superstore_data.groupby(['Year', 'Product_Name']).size().reset_index(name='count')
yearly_top_product = yearly_top_product.sort_values(by=['Year', 'count'], ascending=False).groupby('Year').head(1)

plt.figure(figsize=(12, 8))
sns.barplot(x='Year', y='count', hue='Product_Name', data=yearly_top_product)
plt.xlabel('Year')
plt.ylabel('Count')
plt.title('Year-wise Top-Selling Product')
plt.legend(title='Product Name', bbox_to_anchor=(1.05, 1), loc='upper left')
plt.show()

# E. Visualize the high-rate customers in the City and state
customer_city_state = superstore_data.groupby(['City', 'State', 'Customer_ID']).size().reset_index(name='count')
high_rate_customers = customer_city_state[customer_city_state['count'] > 10]

plt.figure(figsize=(12, 8))
sns.scatterplot(x='City', y='State', hue='count', size='count', data=high_rate_customers, legend='full')
plt.xlabel('City')
plt.ylabel('State')
plt.title('High-Rate Customers in City and State')
plt.legend(title='Number of Orders')
plt.xticks(rotation=45)
plt.show()

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load the dataset with appropriate encoding
superstore_data = pd.read_csv("/content/drive/MyDrive/superstore_final_dataset (1).csv", encoding='latin-1')

# 3. Sales Analysis

# A. Year-wise sales rate
superstore_data['Order_Date'] = pd.to_datetime(superstore_data['Order_Date'])
superstore_data['Year'] = superstore_data['Order_Date'].dt.year
yearly_sales = superstore_data.groupby('Year')['Sales'].sum().reset_index()

plt.figure(figsize=(10, 6))
sns.barplot(x='Year', y='Sales', data=yearly_sales)
plt.xlabel('Year')
plt.ylabel('Total Sales')
plt.title('Year-wise Sales Rate')
plt.show()

# B. Top selling year
top_selling_year = yearly_sales.loc[yearly_sales['Sales'].idxmax()]

print("Top Selling Year:")
print(top_selling_year)

# C. Ship-mode selling details
ship_mode_sales = superstore_data.groupby('Ship_Mode')['Sales'].sum().reset_index()

plt.figure(figsize=(8, 6))
sns.barplot(x='Ship_Mode', y='Sales', data=ship_mode_sales)
plt.xlabel('Ship Mode')
plt.ylabel('Total Sales')
plt.title('Ship-mode Selling Details')
plt.show()

# D. Which city sells more products and fewer products?
city_sales = superstore_data.groupby('City')['Sales'].sum().reset_index()
city_sales_sorted = city_sales.sort_values(by='Sales', ascending=False)

top_city = city_sales_sorted.head(1)
bottom_city = city_sales_sorted.tail(1)

print("City Selling More Products:")
print(top_city)
print("\nCity Selling Fewer Products:")
print(bottom_city)

# E. Segment-wise selling details
segment_sales = superstore_data.groupby('Segment')['Sales'].sum().reset_index()

plt.figure(figsize=(8, 6))
sns.barplot(x='Segment', y='Sales', data=segment_sales)
plt.xlabel('Segment')
plt.ylabel('Total Sales')
plt.title('Segment-wise Selling Details')
plt.show()
