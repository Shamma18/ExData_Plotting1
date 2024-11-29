# Load necessary packages
library(data.table)

# Read and preprocess data
data <- fread("household_power_consumption.txt", na.strings = "?", sep = ";")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
subset_data <- data[data$DateTime >= as.POSIXct("2007-02-01") & data$DateTime <= as.POSIXct("2007-02-02 23:59:59"), ]

# Plot 3: Energy Sub-Metering
png("plot3.png", width = 480, height = 480)
plot(
  subset_data$DateTime, subset_data$Sub_metering_1,
  type = "l", xlab = "", ylab = "Energy Sub Metering"
)
lines(subset_data$DateTime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$DateTime, subset_data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)
dev.off()
