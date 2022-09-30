setwd("~/Documents/Rstudio/Exploratory Data Analysis")
data_raw <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
data <- subset(data_raw, data_raw$Date == "1/2/2007" | data_raw$Date == "2/2/2007" )
GlobalActivePower <- as.numeric(data$Global_active_power)
GlobalReactivePower <- as.numeric(data$Global_reactive_power)
voltage <- as.numeric(data$Voltage)
subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)

png(filename = "./plot3.png", width = 480, height = 480, units = "px")
DateTime <- paste(data$Date, data$Time)
timeseries <- strptime(DateTime, "%d/%m/%Y%H:%M:%S") 
plot(timeseries, subMetering1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "" )
lines(timeseries, subMetering2, type = "l", col = "red" )
lines(timeseries, subMetering3, type = "l", col = "blue" )    

legend("topright",lty=1, lwd=2.5, col=c("black", "red", "blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()



