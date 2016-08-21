householddata <- read.table("household_data.txt" , sep = ";")
names(householddata) <- c("Date","Time","Global_active_power",
                          "Global_reactive_power","Voltage","Global_intensity","Sub_metering_1",
                          "Sub_metering_2","Sub_metering_3")
subsetdata <- subset(householddata, householddata$Date=="1/2/2007" | 
                       householddata$Date=="2/2/2007")
#timedt <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#plot(subsetdata$Time,subsetdata$Sub_metering_1, type="n", ylab = "Energy sub metering")
#with(subsetdata,lines(Time,as.numeric(as.character(Sub_metering_1))))

subsetdata$Date <- as.Date(subsetdata$Date, format("%d/%m/%Y"))
subsetdata$Time <- strptime(subsetdata$Time , format = "%H:%M:%S")
png("plot3.png", width = 480, height = 480)
plot(subsetdata$Time,subsetdata$Sub_metering_1, type = "n" , xlab="" , ylab = "Energy sub metering")
with(subsetdata,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subsetdata,lines(Time,as.numeric(as.character(Sub_metering_2)), col = "red"))
with(subsetdata,lines(Time,as.numeric(as.character(Sub_metering_3)), col = "blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
title(main="Energy sub-metering")
dev.off()

