NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)

vehicle_idx <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
motor_vehicle <- SCC[vehicle_idx,1]
vehicle_data <- NEI[NEI$SCC %in% motor_vehicle,]
vehicles_B <- vehicle_data[vehicle_data$fips == "24510",]
vehicles_B$city <- "Baltimore City"
vehicles_LA <- vehicle_data[vehicle_data$fips=="06037",]
vehicles_LA$city <- "Los Angeles County"

twocities<- rbind(vehicles_B,vehicles_LA)
png(filename = "./project2plot5.png", width = 6, height = 2.5, units = 'in', res = 500)
ggplot(twocities, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(stat="identity") +
  facet_grid(.~city) +
  labs(x="year", y=expression("Total Emission of PM"[2.5]* " (Tons)")) + 
  ggtitle(" Motor Vehicle Source Emissions in Baltimore & LA \n(1999–2008)")
dev.off()
