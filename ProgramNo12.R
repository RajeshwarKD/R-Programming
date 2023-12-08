# Create a data frame with 20 rows and 4 columns
smartphone_df <- data.frame(
  price = sample(10000:50000, 20),
  company_name = sample(c("Samsung", "Apple", "OnePlus", "Xiaomi", "Realme"), 20, replace = TRUE),
  model = paste0("Model ", 1:20),
  sales_percent = sample(10:50, 20)
)

# Write the data frame to an Excel file
library(openxlsx)
write.xlsx(smartphone_df, file = "Smart Phone.xlsx", sheetName = "Sheet1", rowNames = FALSE)

# Read the data frame from the Excel file
smartphone_df <- read.xlsx("Smart Phone.xlsx", sheetName = "Sheet1")

# Find the maximum price of the mobile of each company
max_price <- aggregate(price ~ company_name, smartphone_df, max)

# Find the minimum price of the mobile of each company
min_price <- aggregate(price ~ company_name, smartphone_df, min)

# Find the average price of the mobile of each company
avg_price <- aggregate(price ~ company_name, smartphone_df, mean)

# Find the total price of the mobile of each company
total_price <- aggregate(price ~ company_name, smartphone_df, sum)
