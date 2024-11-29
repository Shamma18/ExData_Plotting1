# Load necessary packages
library(data.table)

# Read and preprocess data
data <- fread("household_power_consumption.txt", na.strings = "?", sep = ";")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
subset_data <- data[data$DateTime >= as.POSIXct("2007-02-01") & data$DateTime <= as.POSIXct("2007-02-02 23:59:59"), ]

# Plot 4: Multi-Panel Plot
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# Top-left: Global Active Power
plot(subset_data$DateTime, subset_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

# Top-right: Voltage
plot(subset_data$DateTime, subset_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Bottom-left: Energy Sub-Metering
plot(subset_data$DateTime, subset_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
lines(subset_data$DateTime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$DateTime, subset_data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, bty = "n")

# Bottom-right: Global Reactive Power
plot(subset_data$DateTime, subset_data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Reactive Power")

dev.off()
