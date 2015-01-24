## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

theseSCC <- SCC[grep("[Vv]ehicle", SCC$SCC.Level.Two),]
vehicleNEI <- NEI[NEI$SCC %in% theseSCC$SCC,]
baltimoreVehicle <- vehicleNEI[vehicleNEI$fips == "24510",]

yearlytotals <- aggregate(Emissions ~ year, data = baltimoreVehicle, sum)

png(filename="plot5.png", width = 480, height = 480, units = "px")
plot(yearlytotals$year, yearlytotals$Emissions, type = "l", main = "Baltimore PM2.5 Emissions from Vehicles ('99-'08)", xlab = "Year", ylab = "Emissions (Tons)")
dev.off()