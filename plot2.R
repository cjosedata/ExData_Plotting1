#plot 2
PCData <- "./Data/household_power_consumption.txt"
PCData <- read.table(PCData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
PCTwoDaysData <- PCData[PCData$Date %in% c("1/2/2007","2/2/2007") ,]
##head(PCTwoDaysData)

#str(PCTwoDaysData)
PCdatetime <- strptime(paste(PCTwoDaysData$Date, PCTwoDaysData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAPower <- as.numeric(PCTwoDaysData$Global_active_power)
plot(PCdatetime, GAPower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()