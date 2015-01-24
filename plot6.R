## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

theseSCC <- SCC[grep("[Vv]ehicle", SCC$SCC.Level.Two),]
vehicleNEI <- NEI[NEI$SCC %in% theseSCC$SCC,]
balt_LA_Vehicle <- vehicleNEI[vehicleNEI$fips == "24510" | vehicleNEI$fips == "06037",]

yearlytotals <- aggregate(Emissions ~ year + fips, data = balt_LA_Vehicle, sum)
yearlytotals$Location <- as.factor(rep(c("LA","Baltimore"), each=4))

g <- qplot(year, Emissions, data = yearlytotals, geom = "line", facets = .~Location)
g <- g + labs(title = "Baltimore & LA PM2.5 Emissions from Vehicles ('99-'08)")
g <- g + labs(y = "Emissions (tons)")

png(filename="plot6.png", width = 600, height = 300, units = "px")
g
dev.off()