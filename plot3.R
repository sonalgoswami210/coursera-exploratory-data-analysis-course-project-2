## This first line will likely take a few seconds. Be patient!

SCC <- readRDS("summarySCC_PM25.rds")
source <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

# Of the four types of sources indicated by the \color{red}{\verb|type|}type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

# 24510 is Baltimore, see plot2.R

subsetSCC  <- SCC[SCC$fips=="24510", ]

aggregatedTotalByYearAndType <- aggregate(Emissions ~ year + type, subsetSCC, sum)

png("plot3.png", width=640, height=480)

g <- ggplot(aggregatedTotalByYearAndType, aes(year, Emissions, color = type))
g <- g + geom_line() +
+     xlab("year") +
+     ylab(expression('Total PM'[2.5]*" Emissions")) +
+     ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')

> print(g)
> dev.off()

