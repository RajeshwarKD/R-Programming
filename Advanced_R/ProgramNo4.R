# Load necessary libraries
library(rvest)
library(dplyr)

# Specify the URL of the webpage to scrape
url <- "https://en.wikipedia.org/wiki/List_of_countries_by_GDP_(nominal)"

# Read the HTML content of the webpage
webpage <- read_html(url)

# Extract the table from the webpage
# Use the CSS selector to identify the table (inspect the webpage to find the correct selector)
gdp_table <- webpage %>%
  html_nodes("table.wikitable") %>%
  html_table(fill = TRUE)

# The html_table() function returns a list of tables, so we select the first one
gdp_table <- gdp_table[[1]]

# View the extracted table
print(gdp_table)

# Clean the data (if necessary)
# For example, remove unnecessary columns or rename columns
gdp_table_cleaned <- gdp_table %>%
  select(Country = `Country/Territory`, GDP = `GDP(US$million)`) %>%
  mutate(GDP = as.numeric(gsub(",", "", GDP)))  # Remove commas and convert GDP to numeric

# View the cleaned table
print(gdp_table_cleaned)

# Save the cleaned data to a CSV file
write.csv(gdp_table_cleaned, "gdp_data.csv", row.names = FALSE)

# Confirm that the file has been saved
cat("Data has been saved to 'gdp_data.csv'.\n")