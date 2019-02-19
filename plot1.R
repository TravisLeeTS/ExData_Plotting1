## Reading and cleaning data

system.time({myData <- read.delim(file="household_power_consumption.txt",header=TRUE, sep=";")})
myData<-read.table(file="household_power_consumption.txt",header=TRUE, sep=";", na.strings=c("NA", "-", "?"))
myData$DateTime <- strptime(paste(myData$Date, myData$Time), format="%d/%m/%Y %H:%M:%S")
myData$NewDate <- strptime(paste(myData$Date), format="%d/%m/%Y")
library(lubridate)
myData$wday <- wday(myData$DateTime, label=TRUE)
year2017 <- subset(myData, NewDate=="2007-02-01" | NewDate=="2007-02-02" )

## plot1.R
hist(year2017$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
