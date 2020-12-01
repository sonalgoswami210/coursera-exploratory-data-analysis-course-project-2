## This first line will likely take a few seconds. Be patient!

SCC <- readRDS("summarySCC_PM25.rds")
source <- readRDS("Source_Classification_Code.rds")

# merge the two data sets 

SCCsource <- merge(SCC, source, by="SCC")

library(ggplot2)

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# 24510 is Baltimore, see plot2.R
# Searching for ON-ROAD type in SCC

subsetSCC <- SCC[SCC$fips=="24510" & SCC$type=="ON-ROAD",  ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetSCC, sum)

png("plot5.png", width=840, height=480)

g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, Maryland (fips = "24510") from 1999 to 2008')
print(g)
dev.off()
