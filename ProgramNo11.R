# Create a data frame with 20 rows and 5 columns
employee_df <- data.frame(
  id = 1:20,
  name = c("John", "Jane", "Bob", "Alice", "Mike", "Sara", "Tom", "Linda", "David", "Mary", "Jack", "Emily", "Alex", "Olivia", "Daniel", "Sophia", "William", "Ava", "James", "Mia"),
  salary = sample(20000:50000, 20),
  start_date = sample(seq(as.Date('2022/01/01'), as.Date('2022/12/31'), by="day"), 20),
  dept = sample(c("IT", "HR", "Sales"), 20, replace = TRUE)
)

# Write the data frame to a CSV file
write.csv(employee_df, file = "input.csv", row.names = FALSE)

# Import the CSV file into R
employee_df <- read.csv("input.csv")

# Find the total number of rows and columns
n_rows <- nrow(employee_df)
n_cols <- ncol(employee_df)

# Find the maximum salary
max_salary <- max(employee_df$salary)

# Retrieve the details of the employee with maximum salary
max_salary_employee <- employee_df[employee_df$salary == max_salary,]

# Retrieve all the employees working in the IT Department
it_employees <- employee_df[employee_df$dept == "IT",]

# Retrieve the employees in the IT Department whose salary is greater than 20000
it_employees_above_20000 <- it_employees[it_employees$salary > 20000,]

# Write the details of the employees in the IT Department whose salary is greater than 20000 to another CSV file
write.csv(it_employees_above_20000, file = "output.csv", row.names = FALSE)
