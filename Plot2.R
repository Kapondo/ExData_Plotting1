## Download and unzip file
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dataFile <- tempfile()
download.file(fileURL, dataFile)
data <- read.table(unz(dataFile, "household_power_consumption.txt"),header=TRUE, sep=";", stringsAsFactors=FALSE, dec="." )
unlink(dataFile)

## Subsetting data for the 2 days
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

#str(subSetData)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
