# Load necessary libraries
install.packages("DBI")
install.packages("RPostgreSQL")
library(DBI)
library(RPostgreSQL)

# Sample data frame
data <- data.frame(
  ID = 1:5,
  Name = c("Alice", "Bob", "Charlie", "David", "Eve"),
  Age = c(25, 30, 35, 40, 45)
)

# PostgreSQL database connection
con <- dbConnect(
  PostgreSQL(),
  user = "your_username",      # Replace with your PostgreSQL username
  password = "your_password",  # Replace with your PostgreSQL password
  dbname = "your_database",    # Replace with your database name
  host = "localhost",          # Replace with your host if not local
  port = 5432                  # Default PostgreSQL port
)

# Write data to PostgreSQL table
dbWriteTable(con, "people", data, overwrite = TRUE)

# Query the table to verify
result <- dbGetQuery(con, "SELECT * FROM people")
print("Data in PostgreSQL:")
print(result)

# Close the connection
dbDisconnect(con)