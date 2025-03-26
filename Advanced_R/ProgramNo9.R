# Load necessary libraries
library(DBI)
library(RSQLite)
library(httr)
library(readxl)
library(dplyr)

# 1. Integrate data from a SQLite database
# Connect to a SQLite database (example: a sample database file)
con <- dbConnect(RSQLite::SQLite(), dbname = "sample.db")

# Query the database to retrieve data
db_data <- dbGetQuery(con, "SELECT * FROM sample_table")

# View the data from the database
print(db_data)

# Disconnect from the database
dbDisconnect(con)

# 2. Integrate data from an API
# Specify the API endpoint (example: JSONPlaceholder API)
api_url <- "https://jsonplaceholder.typicode.com/users"

# Make a GET request to the API
api_response <- GET(api_url)

# Parse the JSON response
api_data <- content(api_response, "parsed")

# Convert the list to a data frame
api_data_df <- do.call(rbind, lapply(api_data, as.data.frame))

# View the data from the API
print(api_data_df)

# 3. Integrate data from an Excel spreadsheet
# Specify the path to the Excel file (example: a sample Excel file)
excel_file <- "sample_data.xlsx"

# Read the Excel file into a data frame
excel_data <- read_excel(excel_file)

# View the data from the Excel file
print(excel_data)

# 4. Combine data from all sources
# Assuming all data frames have a common column (e.g., "id")
# Use dplyr to join the data frames
combined_data <- db_data %>%
  full_join(api_data_df, by = "id") %>%
  full_join(excel_data, by = "id")

# View the combined data
print(combined_data)

# Save the combined data to a CSV file
write.csv(combined_data, "combined_data.csv", row.names = FALSE)

# Confirm that the file has been saved
cat("Combined data has been saved to 'combined_data.csv'.\n")