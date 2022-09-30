
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

comb_idx <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coal_idx <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
idx <- comb_idx & coal_idx
coalcomb <- SCC[idx,1]
cc_data <- NEI[NEI$SCC %in% coalcomb,]
cc_emission<-tapply(cc_data$Emissions, cc_data$year, sum, na.rm=TRUE)
png(filename = "./project2plot4.png", width = 6, height = 5, units = 'in', res = 500)
barplot(cc_emission/10^5,names.arg = names(cc_emission),
             main="Emissions from coal combustion-related sources \n(1999–2008)", 
             xlab = "Year", 
             ylab="Amount of emissions (1E5 Tons)", 
             ylim = range(0,cc_emission)/10^5*1.2)
dev.off()
