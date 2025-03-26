# Load necessary libraries
library(dplyr)

# Example dataset with missing values, duplicates, and outliers
df <- data.frame(
  ID = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 2, 11),  # Duplicate ID = 2
  Age = c(25, 30, NA, 40, 45, 50, 55, 60, 65, 70, 30, 100),  # Missing value (NA) and outlier (100)
  Salary = c(50000, 60000, 70000, 80000, 90000, 100000, 110000, 120000, 130000, 140000, 60000, 200000),  # Duplicate Salary = 60000 and outlier (200000)
  Gender = c("M", "F", "M", "F", "M", "F", "M", "F", "M", "F", "F", "M"),
  Score = c(80, 85, 90, 95, 100, 105, 110, 115, 120, 125, 85, 150)  # Duplicate Score = 85 and outlier (150)
)

# Display the original dataset
print("Original Dataset:")
print(df)

# ---------------------------------------------------------------------------------
# Problem Statement 1: Remove Missing Values
# Missing values can lead to errors in analysis and modeling. We remove rows with NA values.
# ---------------------------------------------------------------------------------
df_cleaned <- df %>%
  na.omit()  # Removes rows with any missing values

# Display the dataset after removing missing values
print("Dataset after removing missing values:")
print(df_cleaned)

# ---------------------------------------------------------------------------------
# Problem Statement 2: Remove Duplicates
# Duplicate rows can skew analysis results. We remove duplicate rows.
# ---------------------------------------------------------------------------------
df_cleaned <- df_cleaned %>%
  distinct()  # Removes duplicate rows

# Display the dataset after removing duplicates
print("Dataset after removing duplicates:")
print(df_cleaned)

# ---------------------------------------------------------------------------------
# Problem Statement 3: Remove Outliers
# Outliers can distort statistical analyses. We use the IQR method to detect and remove outliers.
# ---------------------------------------------------------------------------------
remove_outliers <- function(x, na.rm = TRUE, ...) {
  qnt <- quantile(x, probs = c(0.25, 0.75), na.rm = na.rm, ...)  # Calculate Q1 and Q3
  IQR <- qnt[2] - qnt[1]  # Calculate IQR
  lower_bound <- qnt[1] - 1.5 * IQR  # Lower bound for outliers
  upper_bound <- qnt[2] + 1.5 * IQR  # Upper bound for outliers
  y <- x
  y[x < lower_bound | x > upper_bound] <- NA  # Replace outliers with NA
  y
}

# Apply the outlier removal function to all numeric columns
df_cleaned <- df_cleaned %>%
  mutate(across(where(is.numeric), ~ remove_outliers(.)))

# Remove rows with NA values after outlier removal
df_cleaned <- df_cleaned %>%
  na.omit()

# Display the dataset after removing outliers
print("Dataset after removing outliers:")
print(df_cleaned)

# ---------------------------------------------------------------------------------
# Final Cleaned Dataset
# ---------------------------------------------------------------------------------
print("Final Cleaned Dataset:")
print(df_cleaned)