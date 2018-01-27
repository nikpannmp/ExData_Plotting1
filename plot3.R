energy.data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                          stringsAsFactors = FALSE, dec = ".", na.strings = "?")

reduced.data <- subset(energy.data, Date == "1/2/2007" | Date == "2/2/2007")

timing <- strptime(paste(reduced.data$Date, reduced.data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
sub.metering.1 <- as.numeric(reduced.data$Sub_metering_1)
sub.metering.2 <- as.numeric(reduced.data$Sub_metering_2)
sub.metering.3 <- as.numeric(reduced.data$Sub_metering_3)

png("plot3.png", width = 480, height = 480)
plot(timing, sub.metering.1, type = "n", xlab = "", ylab = "Energy sub metering")
points(timing, sub.metering.1, type = "l")
points(timing, sub.metering.2, type = "l", col = "red")
points(timing, sub.metering.3, type = "l", col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_3", "Sub_metering_3"), 
       lty = 1, lwd = 2.5, col = c("black", "red", "blue"))

dev.off()