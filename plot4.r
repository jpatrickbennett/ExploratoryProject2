## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

theseSCC <- SCC[grep("[Cc]omb(.*)[Cc]oal", SCC$Short.Name),]
coalNEI <- NEI[NEI$SCC %in% theseSCC$SCC,]

yearlytotals <- aggregate(Emissions ~ year, data = coalNEI, sum)
yearlytotals$mTons <- yearlytotals$Emissions / 1000

png(filename="plot4.png", width = 500, height = 480, units = "px")
plot(yearlytotals$year, yearlytotals$mTons, type = "l", main = "Total US PM2.5 Emissions from Coal Combustion Sources ('99-'08)", xlab = "Year", ylab = "Emissions (Thousand Tons)")
dev.off()