data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
day <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subSetData$Sub_metering_1 <- as.numeric(subSetData$Sub_metering_1)
subSetData$Sub_metering_2 <- as.numeric(subSetData$Sub_metering_2)
subSetData$Sub_metering_3 <- as.numeric(subSetData$Sub_metering_3)
subSetData$Global_active_power <- as.numeric(subSetData$Global_active_power)
subSetData$Global_reactive_power <- as.numeric(subSetData$Global_reactive_power)
subSetData$Voltage <- as.numeric(subSetData$Voltage)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(day, subSetData$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(day, subSetData$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(day, subSetData$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(day, subSetData$Sub_metering_2, type="l", col="red")
lines(day, subSetData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(day, subSetData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
