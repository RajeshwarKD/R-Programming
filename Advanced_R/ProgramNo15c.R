# Sample data frame
data <- data.frame(
  ID = 1:5,
  Name = c("Alice", "Bob", "Charlie", "David", "Eve"),
  Age = c(25, 30, 35, 40, 45)
)

# Write data to a CSV file
write.csv(data, file = "people.csv", row.names = FALSE)

# Read the CSV file to verify
read_data <- read.csv("people.csv")
print("Data in CSV File:")
print(read_data)