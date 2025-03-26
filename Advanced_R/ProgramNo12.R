# Load necessary libraries
library(dplyr)

# Sample data frame
data <- data.frame(
  id = c(1, 2, 3, 4, 5),
  name = c("Alice", "Bob", "Charlie", "David", "Eve"),
  age = c(25, 35, 45, 55, 65),
  email = c("alice@example.com", "bob@example.com", "charlie@example.com", "david@example.com", "eve@example.com"),
  salary = c(50000, 60000, 70000, 80000, 90000)
)

# Function to validate data
validate_data <- function(data) {
  # Initialize a list to store validation results
  validation_results <- list()
  
  # Validate 'id' column: should be numeric and positive
  validation_results$id <- all(is.numeric(data$id)) && all(data$id > 0)
  
  # Validate 'name' column: should be character and not empty
  validation_results$name <- all(is.character(data$name)) && all(nchar(data$name) > 0)
  
  # Validate 'age' column: should be numeric and between 18 and 100
  validation_results$age <- all(is.numeric(data$age)) && all(data$age >= 18 & data$age <= 100)
  
  # Validate 'email' column: should be a valid email format
  email_pattern <- "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$"
  validation_results$email <- all(grepl(email_pattern, data$email))
  
  # Validate 'salary' column: should be numeric and positive
  validation_results$salary <- all(is.numeric(data$salary)) && all(data$salary > 0)
  
  # Return the validation results
  return(validation_results)
}

# Run the validation function
validation_results <- validate_data(data)

# Print the validation results
print(validation_results)

# Check if all validations passed
if (all(unlist(validation_results))) {
  cat("All data validations passed successfully.\n")
} else {
  cat("Some data validations failed. Please check the data.\n")
}