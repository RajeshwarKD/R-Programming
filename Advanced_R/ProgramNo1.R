# Load necessary libraries
library(dplyr)

# Sample data frame with missing values, duplicates, and outliers
df <- data.frame(
  ID = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
  Value = c(10, 20, NA, 40, 50, 50, 1000, 60, NA, 70)
)

# Print the original data frame
print("Original Data Frame:")
print(df)

# Step 1: Remove missing values
df_cleaned <- df %>%
  filter(!is.na(Value))

# Print the data frame after removing missing values
print("Data Frame after Removing Missing Values:")
print(df_cleaned)

# Step 2: Remove duplicates
df_cleaned <- df_cleaned %>%
  distinct()

# Print the data frame after removing duplicates
print("Data Frame after Removing Duplicates:")
print(df_cleaned)

# Step 3: Remove outliers using the IQR method
Q1 <- quantile(df_cleaned$Value, 0.25, na.rm = TRUE)
Q3 <- quantile(df_cleaned$Value, 0.75, na.rm = TRUE)
IQR <- Q3 - Q1

lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

df_cleaned <- df_cleaned %>%
  filter(Value >= lower_bound & Value <= upper_bound)

# Print the final cleaned data frame
print("Final Cleaned Data Frame:")
print(df_cleaned)