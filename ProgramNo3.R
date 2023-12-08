marks<- as.integer(readline(prompt="Enter your total marks: "))
if(marks>=800|marks>=1000) {  
  # This block executes when the boolean expression 1 is true.
  cat("Your grade is A+")
} else if(marks>=700|marks>800) {  
  # This block executes when the boolean expression 2 is true.
  cat("Your grade is A")
} else if(marks>=500|marks>700) {  
  # This block executes when the boolean expression 3 is true.
  cat("Your grade is B+")
} else if(marks>=400|marks>500) {  
  # This block executes when the boolean expression 4 is true.
  cat("Your grade is B")
} else if(marks>=150|marks>400) {  
  # This block executes when the boolean expression 5 is true.
  cat("Your grade is C")
} else {
    # This block executes when none of the above condition is true.
  cat("Your grade is D")
} 
