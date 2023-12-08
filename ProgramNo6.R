# Create a list of 10 students
# students <- paste0("Student ", 1:10)
students <- c("Aarav", "Rakesh", "Naresh", "Kiran", "Vikas", "Shyam", "Aarush", "Yug", "Namita", "Rahul")

# Create a list of 3 subjects
subjects <- c("Maths", "Science", "English")

# Create a data frame to store the marks of each student
marks <- data.frame(Maths=c(71, 63, 73, 84, 95, 45, 57, 68, 39, 27),
                    Science=c(87, 62, 55, 39, 27, 69, 82, 98, 97, 19),
                    English=c(38, 36, 66, 76, 78, 68, 97, 79, 47, 34))

# Convert the data frame and list to a data frame with help of column bind
marks_df <- as.data.frame(do.call(cbind, marks))

# Add row names to the data frame
rownames(marks_df) <- students
is.data.frame(marks_df)

# Calculate the total marks, average, maximum marks, and minimum marks of every subject
total_marks <- colSums(marks_df)
average_marks <- colMeans(marks_df)
max_marks <- apply(marks_df, 2, max)
min_marks <- apply(marks_df, 2, min)

# Print the results
cat("Total marks:\n")
print(total_marks)
cat("\nAverage marks:\n")
print(average_marks)
cat("\nMaximum marks:\n")
print(max_marks)
cat("\nMinimum marks:\n")
print(min_marks)