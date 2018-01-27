energy.data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                          stringsAsFactors = FALSE, dec = ".", na.strings = "?")

reduced.data <- subset(energy.data, Date == "1/2/2007" | Date == "2/2/2007")

timing <- strptime(paste(reduced.data$Date, reduced.data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
global.active.power <- as.numeric(reduced.data$Global_active_power)

png("plot2.png", width = 480, height = 480)
plot(timing, global.active.power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()