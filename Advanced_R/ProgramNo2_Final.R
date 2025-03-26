# Load required libraries
library(ggplot2)  # For creating scatterplots, histograms, and boxplots
library(reshape2) # For reshaping data to create the heatmap

# Example dataset
df <- data.frame(
  Age = c(25, 30, 40, 45, 50, 55, 60, 65, 70, 75),            # Age of individuals
  Salary = c(50000, 60000, 80000, 90000, 100000, 110000, 
             120000, 130000, 140000, 150000),                  # Salary of individuals
  Score = c(80, 85, 95, 100, 105, 110, 115, 120, 125, 130),   # Scores of individuals
  Gender = c("M", "F", "M", "F", "M", "F", "M", "F", "M", "F") # Gender of individuals
)

# 1. Scatterplot: Relationship between Age and Salary
ggplot(df, aes(x = Age, y = Salary, color = Gender)) + # Specify Age on x-axis and Salary on y-axis, color points by Gender
  geom_point(size = 3) +                               # Use points of size 3
  labs(title = "Scatterplot: Age vs. Salary",          # Title of the plot
       x = "Age",                                      # Label for x-axis
       y = "Salary") +                                 # Label for y-axis
  theme_minimal()                                      # Apply a minimal theme for cleaner visuals

# Histogram-like visualization: Binning Scores and aggregating Salary
ggplot(df, aes(x = Score, y = Salary)) +             # Mapping Score to x-axis and Salary to y-axis
  geom_col(fill = "yellow", color = "black") +    # Creating bars for visualization
  labs(title = "Histogram: Score vs. Salary Distribution",      # Title of the plot
       x = "Score",                                  # Label for x-axis
       y = "Salary") +                               # Label for y-axis
  theme_minimal()                                    # Apply a minimal theme

# 3. Boxplot: Score Distribution by Gender
ggplot(df, aes(x = Gender, y = Score, fill = Gender)) + # Specify Gender on x-axis and Score on y-axis, fill color by Gender
  geom_boxplot() +                                     # Create a boxplot
  labs(title = "Boxplot: Score by Gender",             # Title of the plot
       x = "Gender",                                   # Label for x-axis
       y = "Score") +                                  # Label for y-axis
  theme_minimal()                                      # Apply a minimal theme for cleaner visuals

# 4. Heatmap: Representation of Age, Salary, and Score
# Reshape the dataset using melt() from the reshape2 package
df_melted <- melt(df, 
                  id.vars = "Gender",                  # Keep Gender as identifier
                  measure.vars = c("Age", "Salary", "Score")) # Variables to be melted

# Create the heatmap
ggplot(df_melted, aes(x = variable, y = Gender, fill = value)) + # Map variables to x-axis, Gender to y-axis, and value to fill color
  geom_tile() +                                      # Use tiles to create the heatmap
  scale_fill_gradient(low = "pink", high = "red") + # Gradient color scheme from white to blue
  labs(title = "Heatmap: Values by Gender and Attribute", # Title of the heatmap
       x = "Attribute",                               # Label for x-axis
       y = "Gender") +                                # Label for y-axis
  theme_minimal()                                     # Apply a minimal theme for cleaner visuals
