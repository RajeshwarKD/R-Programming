# Load necessary libraries
library(dplyr)
library(caret)  # For pre-processing functions

# Sample data frame
data <- data.frame(
  id = c(1, 2, 3, 4, 5),
  age = c(25, 35, 45, 55, 65),
  salary = c(50000, 60000, 70000, 80000, 90000),
  years_of_experience = c(1, 3, 5, 7, 9)
)

# Display the original data
cat("Original Data:\n")
print(data)

# 1. Scaling: Standardize numeric columns (mean = 0, standard deviation = 1)
scaled_data <- data %>%
  mutate(across(c(age, salary, years_of_experience), scale))

cat("\nScaled Data (Standardization):\n")
print(scaled_data)

# 2. Normalization: Rescale numeric columns to a range of [0, 1]
normalized_data <- data %>%
  mutate(across(c(age, salary, years_of_experience), ~ (. - min(.)) / (max(.) - min(.))))

cat("\nNormalized Data (Min-Max Scaling):\n")
print(normalized_data)

# 3. Feature Engineering: Create new features
# Example: Create a new feature 'salary_per_year_of_experience'
feature_engineered_data <- data %>%
  mutate(salary_per_year_of_experience = salary / years_of_experience)

cat("\nFeature Engineered Data:\n")
print(feature_engineered_data)

# 4. Log Transformation: Apply log transformation to reduce skewness
# Example: Apply log transformation to 'salary'
log_transformed_data <- data %>%
  mutate(log_salary = log(salary))

cat("\nLog Transformed Data:\n")
print(log_transformed_data)

# 5. One-Hot Encoding: Convert categorical variables to binary (dummy) variables
# Example: Add a categorical column and encode it
data_with_category <- data %>%
  mutate(category = c("A", "B", "A", "C", "B"))  # Add a categorical column

encoded_data <- dummyVars(~ category, data = data_with_category) %>%
  predict(newdata = data_with_category) %>%
  as.data.frame() %>%
  bind_cols(data_with_category, .)

cat("\nData with One-Hot Encoding:\n")
print(encoded_data)