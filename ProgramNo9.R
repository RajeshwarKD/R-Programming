# Create a list containing strings, numbers, vectors, and logical values
list_data <- list("Python", "PHP", c(5, 7, 9, 11), TRUE, 125.17, 75.83)
print(list_data)

# a. Access the first element in the list
first_element <- list_data[[1]]
cat(first_element)

# b. Give names to the elements in the list
names(list_data) <- c("Language1", "Language2", "Numbers", "Flag", "Value1", "Value2")
print(list_data)

# c. Add an element at a specific position in the list
list_data[["NewElement"]] <- "New Value"
print(list_data)

# d. Remove an element from the list
list_data[["Language2"]] <- NULL
print(list_data)

# e. Print the fourth element
fourth_element <- list_data[["Flag"]]
cat(fourth_element)

# f. Update the third element and print the modified list 
list_data[["Numbers"]][3] <- 99
print("Data of the list:")
print(list_data)
