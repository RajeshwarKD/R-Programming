# Load required libraries
library(caret)  # For machine learning workflows
library(ggplot2) # For plotting results

# Example dataset: mtcars
data <- mtcars
head(data)  # View the first few rows of the dataset

# Set seed for reproducibility
set.seed(123)

# Split data into training and testing sets (80% training, 20% testing)
train_index <- createDataPartition(data$mpg, p = 0.8, list = FALSE)
train_data <- data[train_index, ]
test_data <- data[-train_index, ]

# Train the machine learning model using Random Forest
model <- train(mpg ~ hp + wt,                    # Formula for predicting mpg based on hp and wt
               data = train_data,                # Training dataset
               method = "rf",                    # Specify Random Forest algorithm
               trControl = trainControl(method = "cv", number = 10)) # Cross-validation with 10 folds

# Summary of the trained model
print(model)

# Predict outcomes on the test dataset
predictions <- predict(model, newdata = test_data)

# Evaluate model performance: Root Mean Square Error (RMSE)
rmse <- RMSE(predictions, test_data$mpg)
cat("RMSE:", rmse, "\n")

# Visualize the relationship between actual and predicted values
results <- data.frame(Actual = test_data$mpg, Predicted = predictions)

ggplot(results, aes(x = Actual, y = Predicted)) +
  geom_point(color = "blue", size = 3) +
  geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed") +  # Ideal prediction line
  labs(title = "Actual vs Predicted mpg",
       x = "Actual mpg",
       y = "Predicted mpg") +
  theme_minimal()
