# Load necessary libraries
library(ggplot2)
library(reshape2)  # For heatmap

# Sample data frame
set.seed(123)
data <- data.frame(
  X = rnorm(100, mean = 50, sd = 10),
  Y = rnorm(100, mean = 50, sd = 10),
  Category = sample(c("A", "B", "C"), 100, replace = TRUE)
)

# Display the first few rows of the data
print("Sample Data:")
print(head(data))

# 1. Scatterplot
scatterplot <- ggplot(data, aes(x = X, y = Y, color = Category)) +
  geom_point(size = 3, alpha = 0.7) +
  labs(title = "Scatterplot of X vs Y",
       x = "X",
       y = "Y") +
  theme_minimal()

print(scatterplot)

# 2. Histogram
histogram <- ggplot(data, aes(x = X, fill = Category)) +
  geom_histogram(binwidth = 5, alpha = 0.7, position = "identity") +
  labs(title = "Histogram of X",
       x = "X",
       y = "Frequency") +
  theme_minimal()

print(histogram)

# 3. Heatmap
# Create a correlation matrix for heatmap
correlation_matrix <- cor(data[, c("X", "Y")])
melted_correlation_matrix <- melt(correlation_matrix)

heatmap <- ggplot(melted_correlation_matrix, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", midpoint = 0) +
  labs(title = "Heatmap of Correlation Matrix",
       x = "",
       y = "") +
  theme_minimal()

print(heatmap)

# 4. Boxplot (Bonus)
boxplot <- ggplot(data, aes(x = Category, y = X, fill = Category)) +
  geom_boxplot(alpha = 0.7) +
  labs(title = "Boxplot of X by Category",
       x = "Category",
       y = "X") +
  theme_minimal()

print(boxplot)