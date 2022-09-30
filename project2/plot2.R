NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png(filename = "./project2plot2.png", width = 6, height = 5, units = 'in', res = 500)
M_emission <- NEI[NEI$fips == "24510",]
M_emission_year<-tapply(M_emission$Emissions, M_emission$year, sum, na.rm=TRUE)
barplot(M_emission_year,names.arg = names(M_emission_year),
        main="Emissions of PM2.5 in Baltimore City, 1999–2008", 
        xlab = "Year", 
        ylab="Amount of emissions", 
        ylim = range(0,M_emission_year))
dev.off()