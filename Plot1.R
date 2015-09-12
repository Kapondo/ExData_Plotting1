## Download and unzip file
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dataFile <- tempfile()
download.file(fileURL, dataFile)
data <- read.table(unz(dataFile, "household_power_consumption.txt"),header=TRUE, sep=";", stringsAsFactors=FALSE, dec="." )
unlink(dataFile)

## Subsetting data for the 2 days
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

# Checking the structure of the subset data: str(subSetData) and plot histogram using base plot
GlobalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(GlobalActivePower, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
