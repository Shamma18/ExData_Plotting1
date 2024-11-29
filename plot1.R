# Load necessary packages
library(data.table)

# Read and preprocess data
data <- fread("household_power_consumption.txt", na.strings = "?", sep = ";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subset_data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"), ]

# Plot 1: Global Active Power Histogram
png("plot1.png", width = 480, height = 480)
hist(
  subset_data$Global_active_power,
  col = "red",
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)",
  ylab = "Frequency"
)
dev.off()
