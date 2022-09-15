setwd("~/Documents/Rstudio/Exploratory Data Analysis")
data_raw <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
data <- subset(data_raw, data_raw$Date == "1/2/2007" | data_raw$Date == "2/2/2007" )

#Convert all data into numeric form

GlobalActivePower <- as.numeric(data$Global_active_power)
GlobalReactivePower <- as.numeric(data$Global_reactive_power)
voltage <- as.numeric(data$Voltage)
subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)

png(filename = "./plot2.png", width = 480, height = 480, units = "px")
DateTime <- paste(data$Date, data$Time)
timeseries <- strptime(DateTime, "%d/%m/%Y%H:%M:%S") 
# convert the Date and Time variables to Date/Time classes
plot(timeseries, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()