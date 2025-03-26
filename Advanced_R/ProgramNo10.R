# Load necessary libraries
library(arules)       # For association rule mining
library(ggplot2)      # For data visualization
library(dbscan)       # For anomaly detection
library(dplyr)        # For data manipulation

# Load a sample dataset (Groceries dataset for association rules)
data("Groceries")

# 1. Association Rule Mining
# Find frequent itemsets and generate association rules
rules <- apriori(Groceries, parameter = list(support = 0.01, confidence = 0.5))

# Inspect the top 5 rules
inspect(head(rules, 5))

# Visualize the rules (requires arulesViz package)
# install.packages("arulesViz")  # Uncomment to install
library(arulesViz)
plot(rules, method = "graph", engine = "htmlwidget")

# 2. Clustering (K-Means)
# Use the iris dataset for clustering
data("iris")

# Select numeric columns for clustering
iris_numeric <- iris %>% select(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width)

# Perform K-Means clustering (k = 3 clusters)
set.seed(123)  # For reproducibility
kmeans_result <- kmeans(iris_numeric, centers = 3)

# Add cluster labels to the dataset
iris_clustered <- iris_numeric %>%
  mutate(Cluster = as.factor(kmeans_result$cluster))

# Visualize the clusters
ggplot(iris_clustered, aes(x = Sepal.Length, y = Sepal.Width, color = Cluster)) +
  geom_point(size = 3) +
  labs(title = "K-Means Clustering of Iris Dataset",
       x = "Sepal Length",
       y = "Sepal Width") +
  theme_minimal()

# 3. Anomaly Detection (DBSCAN)
# Use the iris dataset for anomaly detection
# Perform DBSCAN clustering (eps = 0.5, minPts = 5)
dbscan_result <- dbscan(iris_numeric, eps = 0.5, minPts = 5)

# Add anomaly labels to the dataset
iris_anomalies <- iris_numeric %>%
  mutate(Anomaly = ifelse(dbscan_result$cluster == 0, "Anomaly", "Normal")))

# Visualize anomalies
ggplot(iris_anomalies, aes(x = Sepal.Length, y = Sepal.Width, color = Anomaly)) +
  geom_point(size = 3) +
  labs(title = "Anomaly Detection in Iris Dataset (DBSCAN)",
       x = "Sepal Length",
       y = "Sepal Width") +
  theme_minimal()