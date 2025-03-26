# Load necessary libraries
library(readr)
library(jsonlite)

# Specify the path to the CSV file
csv_file <- "data.csv"

# Read the CSV file into a data frame
data <- read_csv(csv_file)

# View the data frame
print(data)

# Convert the data frame to JSON format
json_data <- toJSON(data, pretty = TRUE)

# View the JSON data
cat(json_data)

# Specify the path to the output JSON file
json_file <- "data.json"

# Write the JSON data to a file
write(json_data, json_file)

# Confirm that the file has been saved
cat("Data has been saved to 'data.json'.\n")