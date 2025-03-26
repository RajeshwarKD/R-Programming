# Install and load rhdfs
install.packages("rhdfs")
library(rhdfs)

# Initialize hdfs
hdfs.init()

# Sample data frame
data <- data.frame(
  ID = 1:5,
  Name = c("Alice", "Bob", "Charlie", "David", "Eve"),
  Age = c(25, 30, 35, 40, 45)
)

# Write data to HDFS
hdfs.write(data, file = "/user/your_username/people.csv")

# Read data from HDFS to verify
hdfs_data <- hdfs.read("/user/your_username/people.csv")
print("Data in HDFS:")
print(hdfs_data)

# Close HDFS connection
hdfs.close()