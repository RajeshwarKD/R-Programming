# Load necessary libraries
library(dplyr)

# Sample data frame
data <- data.frame(
  Category = c("A", "B", "A", "B", "A", "B", "C", "C", "C"),
  Value = c(10, 20, 15, 25, 30, 35, 40, 45, 50),
  Group = c("X", "X", "Y", "Y", "X", "Y", "X", "Y", "X")
)

# Display the original data
print("Original Data:")
print(data)

# Step 1: Group the data by 'Category' and 'Group'
grouped_data <- data %>%
  group_by(Category, Group)

# Step 2: Summarize the data by calculating the mean and sum of 'Value'
summarized_data <- grouped_data %>%
  summarise(
    Mean_Value = mean(Value),
    Sum_Value = sum(Value)
  )

# Display the summarized data
print("Summarized Data:")
print(summarized_data)

# Step 3: Filter the summarized data to include only groups with a mean value greater than 20
filtered_data <- summarized_data %>%
  filter(Mean_Value > 20)

# Display the filtered data
print("Filtered Data:")
print(filtered_data)