## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- NEI[NEI$fips == "24510",]

yearlytotals <- aggregate(Emissions ~ year, data = baltimore, sum)
yearlytotals$mmTons <- yearlytotals$Emissions / 1000000

png(filename="plot2.png", width = 480, height = 480, units = "px")
plot(yearlytotals$year, yearlytotals$mmTons, type = "l", main = "Baltimore Total PM2.5 Emissions from All Sources ('99-'08)", xlab = "Year", ylab = "Total Emissions (Million Tons)")
dev.off()