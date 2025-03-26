# Load necessary libraries
library(dplyr)
library(ggplot2)

# Load the mtcars dataset
data("mtcars")

# View the first few rows of the dataset
head(mtcars)

# Hypothesis Testing: t-test to compare the mean mpg of automatic vs manual transmission cars
# Create a binary variable for transmission type (0 = automatic, 1 = manual)
mtcars <- mtcars %>%
  mutate(am = as.factor(am))

# Perform t-test
t_test_result <- t.test(mpg ~ am, data = mtcars)
print(t_test_result)

# Regression Analysis: Linear regression to predict mpg based on hp (horsepower) and wt (weight)
linear_model <- lm(mpg ~ hp + wt, data = mtcars)
summary(linear_model)

# Plot the regression results
ggplot(mtcars, aes(x = hp, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", col = "blue") +
  labs(title = "Linear Regression: MPG vs Horsepower",
       x = "Horsepower (hp)",
       y = "Miles per Gallon (mpg)") +
  theme_minimal()

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", col = "red") +
  labs(title = "Linear Regression: MPG vs Weight",
       x = "Weight (wt)",
       y = "Miles per Gallon (mpg)") +
  theme_minimal()

# ANOVA: Analysis of Variance to compare the mean mpg across different cylinder groups
# Convert cyl (cylinders) to a factor
mtcars <- mtcars %>%
  mutate(cyl = as.factor(cyl))

# Perform ANOVA
anova_result <- aov(mpg ~ cyl, data = mtcars)
summary(anova_result)

# Plot the ANOVA results
ggplot(mtcars, aes(x = cyl, y = mpg, fill = cyl)) +
  geom_boxplot() +
  labs(title = "ANOVA: MPG across Cylinder Groups",
       x = "Number of Cylinders",
       y = "Miles per Gallon (mpg)") +
  theme_minimal()