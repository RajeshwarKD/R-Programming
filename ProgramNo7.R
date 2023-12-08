#Installing xlsx package using R Console  
install.packages("xlsx")  

# Loading the library readxl and xlsx package into R workspace.
library(readxl)
library("xlsx")

# Verifying the package is installed.  
any(grepl("xlsx",installed.packages()))  

# Getting and printing current working directory.  
print(getwd())

# Setting the current working directory.  
setwd("D:/R_Program")

# Import data from a path to Excel file.xlsx
excel_data <- read.xlsx("D:/R_Program/car-speed.xlsx", sheetIndex = 1)

# Write the data to a CSV file
write.csv(excel_data, "D:/R_Program/car-speed.csv")

# Read the data from a CSV file to Dataframes 
csv_data <- read.csv("D:/R_Program/car-speed.csv")
View(csv_data)
is.data.frame(csv_data)

# All the variable names
names(csv_data)
# Show the name of each column in the data frames
colnames(csv_data)

# The summary function is useful to quickly summarize the values in data frame
summary(csv_data)

# Remove the data frames from the workspace
rm(csv_data)

# Get the dimensions (rows and columns) of the data
dim(csv_data)
ncol(csv_data)
nrow(csv_data)

# View the first 6 rows of the data frame
head(csv_data)

# View the last 6 rows of the data frame
tail(csv_data)

# Find position of a matched pattern in a data frame
grep("Color", colnames(csv_data))

# Sort the data by a variable
sorted_data <- csv_data[order(csv_data$State),]

# Filter the data by a condition
filtered_data1 <- subset(csv_data, State == "Australia")
filtered_data2 <- subset(csv_data, Speed > 35)

# Search for a value in the data
search_result <- csv_data[csv_data$State == "NewMexico",]

#-------------------------------------------------------#
# Loading the dplyr package
install.packages("dplyr")
library("dplyr")

# Filter the data by a condition using dplyr package
filter(csv_data, State == "India")
filter(csv_data, Speed > 35)

#select/Search rows where 45 appears in any column using pipe(%>%) operator
csv_data %>% filter_all(any_vars(. %in% c(45)))


