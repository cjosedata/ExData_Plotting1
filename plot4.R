#plot 4
PCData <- "./Data/household_power_consumption.txt"
PCData <- read.table(PCData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
PCTwoDaysData <- PCData[PCData$Date %in% c("1/2/2007","2/2/2007") ,]
##head(PCTwoDaysData)

#str(PCTwoDaysData)
PCdatetime<- strptime(paste(PCTwoDaysData$Date, PCTwoDaysData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAPower <- as.numeric(PCTwoDaysData$Global_active_power)
voltage <- as.numeric(PCTwoDaysData$Voltage)
subMetering1 <- as.numeric(PCTwoDaysData$Sub_metering_1)
subMetering2 <- as.numeric(PCTwoDaysData$Sub_metering_2)
subMetering3 <- as.numeric(PCTwoDaysData$Sub_metering_3)

par(mfrow = c(2, 2)) 

plot(PCdatetime, GAPower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(PCdatetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(PCdatetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(PCdatetime, subMetering2, type="l", col="red")
lines(PCdatetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(PCdatetime, GAPower , type="l", xlab="datetime", ylab="Global_reactive_power")
dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()