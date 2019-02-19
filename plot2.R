#Reading, naming and subsetting power consumption data
Data <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(Data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subSetData <- subset(Data,Data$Date=="1/2/2007" | Data$Date =="2/2/2007")

#calling the basic plot function
subSetData$datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
plot(subSetData$datetime, as.numeric(as.character(subSetData$Global_active_power)), type="l", xlab="", ylab="Global Active Power (kilowatts)")

#save the plot to a PNG file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
