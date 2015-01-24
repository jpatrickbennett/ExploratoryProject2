library(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- NEI[NEI$fips == "24510",]
baltimore$type <- as.factor(baltimore$type)

yearlytotals <- aggregate(Emissions ~ year + type, data = baltimore, sum)

g <- qplot(year, Emissions, data = yearlytotals, geom = "line", facets = .~type)
g <- g + labs(title = "Baltimore Total PM2.5 Emissions by Type ('99-'08)")
g <- g + labs(y = "Emissions (tons)")

png(filename="plot3.png", width = 600, height = 240, units = "px")
g
dev.off()