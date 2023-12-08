# Create a list of numbers from 1 to 50
my_list <- 1:50

# Define a function to search for a number in the list
search_list <- function(num) {
  if (num %in% my_list) {
    cat("The search is successful.")
  } else {
    cat("The number is not in the list.")
  }
}

# Call the function with a number to for search 
num<-as.numeric(readline(prompt="Please enter the number to search in the list: ")) 
search_list(num)