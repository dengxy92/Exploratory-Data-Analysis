NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
emission_year<-tapply(NEI$Emissions, NEI$year, sum, na.rm=TRUE)

png(filename = "./project2plot1.png", width = 600, height = 500, units = 'px')
h <- barplot(emission_year/10^6,names.arg = names(emission_year),
             main="Emissions of PM 2.5 (1999–2008)", 
             xlab = "Year", 
             ylab="Amount of emissions (1E6 Tons)", 
             ylim = range(0,emission_year)/10^6*1.2)
dev.off()