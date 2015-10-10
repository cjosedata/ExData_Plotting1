#plot1
PCData <- "./Data/household_power_consumption.txt"
PCData <- read.table(PCData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
PCTwoDaysData <- PCData[PCData$Date %in% c("1/2/2007","2/2/2007") ,]
##head(PCTwoDaysData)

#str(PCTwoDaysData)
GAPower <- as.numeric(PCTwoDaysData$Global_active_power)
hist(GAPower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", height=480, width=480)

dev.off()