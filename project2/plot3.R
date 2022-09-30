NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)
M_emission <- NEI[NEI$fips == "24510",]
png(filename = "./project2/plot3.png", width = 600, height = 500, units = 'px')
(ggplot(M_emission, aes(year, Emissions, fill = type))+geom_bar(stat="identity")+
  facet_wrap(.~type, nrow=2, ncol=2) + ylab(expression('Total PM'[2.5]*" Emissions"))+
ggtitle("Total Emissions in Baltimore City (1999-008)") 
  + scale_x_continuous(breaks = c(1998, 2002, 2005,2008)))


dev.off()