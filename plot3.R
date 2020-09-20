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

########## third plot
png(file="plot3.png")
plot(fixedtime,cutData$Sub_metering_1, type="l",col= "black" ,ylab="Energy sub metering")
lines(fixedtime,cutData$Sub_metering_2, type="l",col= "red")
lines(fixedtime,cutData$Sub_metering_3, type="l",col= "blue")
namess<- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright", legend=namess,col = c("black","red","blue"),lty="solid")
dev.off()
