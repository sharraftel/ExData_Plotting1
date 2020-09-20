downloadURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
downloadFile <- "./data/household_power_consumption.zip"
householdFile <- "./data/household_power_consumption.txt"
##
if (!file.exists(householdFile)) {
  download.file(downloadURL, downloadFile)
  unzip(downloadFile, overwrite = T, exdir = "./Data")
}
tabledData <- read.table(householdFile, header=T, sep=";", na.strings="?")
cutData <- tabledData[tabledData$Date %in% c("1/2/2007","2/2/2007"),]
fixedtime <-strptime(paste(cutData$Date, cutData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
cutData <- cbind(fixedtime,cutData)
########## first plot
png(file="plot1.png")
hist(cutData$Global_active_power,col = "red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()