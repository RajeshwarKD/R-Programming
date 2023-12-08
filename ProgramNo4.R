cat("1) For Addition\n")  
cat("2) For Subtraction\n")  
cat("3) For Multiplication\n")  
cat("4) For Division\n") 
n1<-as.integer(readline(prompt="Enter first number:"))  
n2<-as.integer(readline(prompt="Enter second number:"))  
choice<-as.character(readline(prompt="Enter your choice:"))

add<- function(x,y){
  return(x+y)
}
subtract<- function(x,y){
  return(x-y)
}
multiply<- function(x,y){
  return(x*y)
}
divide<- function(x,y){
  return(x/y)
}

# Syntax of switch(expression, case1, case2, case3....)
# Using this cased on matching value as a string(character)
switch(choice,  
       "1"=cat("Addition of two number =",add(n1,n2)),  
       "2"=cat("Subtraction of two number =",subtract(n1,n2)),
       "3"=cat("Multiplication of two number =",multiply(n1,n2)),
       "4"=cat("Division of two number =",divide(n1,n2))
)  