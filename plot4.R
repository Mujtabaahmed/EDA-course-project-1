householddata <- read.table("household_data.txt" , sep = ";")
names(householddata) <- c("Date","Time","Global_active_power",
                          "Global_reactive_power","Voltage","Global_intensity","Sub_metering_1",
                          "Sub_metering_2","Sub_metering_3")
subsetdata <- subset(householddata, householddata$Date=="1/2/2007" | 
                       householddata$Date=="2/2/2007")
timedt <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subsetdata$Date <- as.Date(subsetdata$Date, format("%d/%m/%Y"))
subsetdata$Time <- strptime(subsetdata$Time , format = "%H:%M:%S")
png("plot4.png")
par(mfrow=c(2,2) , mar = c(2,2,2,2), oma = c(2,2,2,2))
orinaldata <- as.numeric(as.character(subsetdata$Global_active_power))
plot(timedt,orinaldata, type="l" ,xlab="",ylab="Global Active Power")
orinaldataV <- as.numeric(as.character(subsetdata$Voltage))
plot(timedt,orinaldataV, type="l", xlab = "datetime" , ylab="Voltage")
plot(subsetdata$Time,subsetdata$Sub_metering_1, type = "n" , xlab="" , ylab = "Energy sub metering") 
  with(subsetdata,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(subsetdata,lines(Time,as.numeric(as.character(Sub_metering_2)), col = "red"))
  with(subsetdata,lines(Time,as.numeric(as.character(Sub_metering_3)), col = "blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
orinaldataR <- as.numeric(as.character(subsetdata$Global_reactive_power))
plot(timedt,orinaldataR, type="l", xlab = "datetime" , ylab="Voltage")
dev.off()


