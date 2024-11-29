# Load necessary packages
library(data.table)

# Read and preprocess data
data <- fread("household_power_consumption.txt", na.strings = "?", sep = ";")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
subset_data <- data[data$DateTime >= as.POSIXct("2007-02-01") & data$DateTime <= as.POSIXct("2007-02-02 23:59:59"), ]

# Plot 2: Global Active Power Time Series
png("plot2.png", width = 480, height = 480)
plot(
  subset_data$DateTime, subset_data$Global_active_power,
  type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"
)
dev.off()
