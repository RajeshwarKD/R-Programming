# Load necessary libraries
library(dplyr)
library(ggplot2)
library(rpart)
library(rpart.plot)
library(randomForest)
library(caret)

# Load the mtcars dataset
data("mtcars")

# View the first few rows of the dataset
head(mtcars)

# Linear Regression: Predict mpg based on hp (horsepower) and wt (weight)
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

# Decision Tree: Predict mpg based on hp and wt
decision_tree_model <- rpart(mpg ~ hp + wt, data = mtcars, method = "anova")
print(decision_tree_model)

# Plot the decision tree
rpart.plot(decision_tree_model, main = "Decision Tree: MPG Prediction")

# Random Forest: Predict mpg based on hp and wt
set.seed(123)  # For reproducibility
random_forest_model <- randomForest(mpg ~ hp + wt, data = mtcars, ntree = 100)
print(random_forest_model)

# Plot the random forest variable importance
varImpPlot(random_forest_model, main = "Random Forest: Variable Importance")

# Model Evaluation: Cross-validation for linear regression
train_control <- trainControl(method = "cv", number = 10)
cv_linear_model <- train(mpg ~ hp + wt, data = mtcars, method = "lm", trControl = train_control)
print(cv_linear_model)

# Model Evaluation: Cross-validation for decision tree
cv_decision_tree_model <- train(mpg ~ hp + wt, data = mtcars, method = "rpart", trControl = train_control)
print(cv_decision_tree_model)

# Model Evaluation: Cross-validation for random forest
cv_random_forest_model <- train(mpg ~ hp + wt, data = mtcars, method = "rf", trControl = train_control)
print(cv_random_forest_model)