# Load necessary libraries
install.packages("DBI")
install.packages("RMySQL")
library(DBI)
library(RMySQL)

# Sample data frame
data <- data.frame(
  ID = 1:5,
  Name = c("Alice", "Bob", "Charlie", "David", "Eve"),
  Age = c(25, 30, 35, 40, 45)
)

# MySQL database connection
con <- dbConnect(
  MySQL(),
  user = "your_username",      # Replace with your MySQL username
  password = "your_password",  # Replace with your MySQL password
  dbname = "your_database",    # Replace with your database name
  host = "localhost"           # Replace with your host if not local
)

# Write data to MySQL table
dbWriteTable(con, "people", data, overwrite = TRUE)

# Query the table to verify
result <- dbGetQuery(con, "SELECT * FROM people")
print("Data in MySQL:")
print(result)

# Close the connection
dbDisconnect(con)