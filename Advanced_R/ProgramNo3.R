# Load necessary libraries
library(caret)
library(randomForest)

# Load the iris dataset
data("iris")

# Set seed for reproducibility
set.seed(123)

# Split the data into training and testing sets (70% training, 30% testing)
train_index <- createDataPartition(iris$Species, p = 0.7, list = FALSE)
train_data <- iris[train_index, ]
test_data <- iris[-train_index, ]

# Train a Random Forest model
# Use 10-fold cross-validation
train_control <- trainControl(method = "cv", number = 10)

# Train the model
rf_model <- train(Species ~ ., 
                  data = train_data, 
                  method = "rf", 
                  trControl = train_control, 
                  tuneLength = 5)

# Print the model summary
print(rf_model)

# Make predictions on the test data
predictions <- predict(rf_model, newdata = test_data)

# Evaluate the model's performance
confusion_matrix <- confusionMatrix(predictions, test_data$Species)
print(confusion_matrix)

# Feature importance
importance <- varImp(rf_model)
print(importance)

# Plot feature importance
plot(importance)