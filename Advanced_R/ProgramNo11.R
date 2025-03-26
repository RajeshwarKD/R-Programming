# Load necessary libraries
library(dplyr)
library(ggplot2)
library(summarytools)

# Load the mtcars dataset
data("mtcars")

# View the first few rows of the dataset
head(mtcars)

# 1. Data Profiling
# Get a quick overview of the dataset
str(mtcars)

# Generate a data profiling report using summarytools
dfSummary(mtcars)

# 2. Summary Statistics
# Calculate summary statistics for numeric columns
summary(mtcars)

# Calculate specific statistics (mean, median, standard deviation)
mtcars %>%
  summarise(across(everything(), list(mean = mean, median = median, sd = sd)))

# 3. Data Visualization
# Histogram: Distribution of miles per gallon (mpg)
ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black") +
  labs(title = "Histogram of Miles per Gallon (mpg)",
       x = "Miles per Gallon (mpg)",
       y = "Frequency") +
  theme_minimal()

# Scatterplot: Relationship between horsepower (hp) and miles per gallon (mpg)
ggplot(mtcars, aes(x = hp, y = mpg)) +
  geom_point(color = "red", size = 3) +
  labs(title = "Scatterplot of Horsepower vs MPG",
       x = "Horsepower (hp)",
       y = "Miles per Gallon (mpg)") +
  theme_minimal()

# Boxplot: Distribution of mpg by number of cylinders (cyl)
ggplot(mtcars, aes(x = factor(cyl), y = mpg)) +
  geom_boxplot(fill = "orange") +
  labs(title = "Boxplot of MPG by Number of Cylinders",
       x = "Number of Cylinders",
       y = "Miles per Gallon (mpg)") +
  theme_minimal()

# Correlation Heatmap: Correlation between numeric variables
correlation_matrix <- cor(mtcars)
heatmap(correlation_matrix, 
        col = colorRampPalette(c("blue", "white", "red"))(20),
        main = "Correlation Heatmap of mtcars Dataset")