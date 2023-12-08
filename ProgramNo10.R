# Load the airquality dataset
data("airquality")

# Assign meaningful names to the columns using air quality data with help of airquality dataset 
colnames(airquality) <- c("Ozone", "Solar.R", "Wind", "Temp", "Month", "Day")

# Change colours of the histogram with temperature data
hist(airquality$Temp, col = "lightgreen", main = "Temperature Histogram", xlab = "Temperature (°F)")

# Create a histogram without axis and add custom axis labels
hist(airquality$Temp, col = "skyblue", main = "Temperature Histogram", xlab = "Temperature (°F)", axes = FALSE)

# Add custom axis labels
axis(1, at = seq(50, 100, by = 10), labels = paste(seq(50, 100, by = 10), "°F"))
axis(2, las = 1)

# Create a histogram with custom x-axis limits
hist(airquality$Temp, col = "orange", main = "Temperature Histogram", xlab = "Temperature (°F)", xlim = c(50, 100))

# Create a density histogram with add a density curve
hist(airquality$Temp, col = "pink", main = "Temperature Histogram (Density)", xlab = "Temperature (°F)", freq = FALSE)

# Add a density curve
lines(density(airquality$Temp), col = "red", lwd = 2)
