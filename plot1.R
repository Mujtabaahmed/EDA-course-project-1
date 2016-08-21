householddata <- read.table("household_data.txt" , sep = ";")
names(householddata) <- c("Date","Time","Global_active_power",
"Global_reactive_power","Voltage","Global_intensity","Sub_metering_1",
"Sub_metering_2","Sub_metering_3")
subsetdata <- subset(householddata, householddata$Date=="1/2/2007" | 
householddata$Date=="2/2/2007")
orinaldata <- as.numeric(as.character(subsetdata$Global_active_power))
hist(orinaldata,col = "red", main = "Global Active Power" , xlab = 
"Global Active Power (Kilowatts)")
