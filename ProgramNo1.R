year<- as.integer(readline(prompt="Enter a year: "))
if((year %% 4) == 0) {
  if((year %% 100) == 0) {
    if((year %% 400) == 0) {
      cat(paste(year,"is a leap year"))
    } else {
      cat(paste(year,"is not a leap year"))
    }
  } else {
    cat(paste(year,"is a leap year"))
  }
} else {
  cat(paste(year,"is not a leap year"))
}
