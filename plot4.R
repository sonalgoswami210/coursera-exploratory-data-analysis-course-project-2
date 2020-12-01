## This first line will likely take a few seconds. Be patient!

SCC <- readRDS("summarySCC_PM25.rds")
source <- readRDS("Source_Classification_Code.rds")

SCCsource <- merge(SCC, source, by="SCC")

library(ggplot2)
# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

# fetch all SCCxsource records with Short.Name (SCC) Coal

coalMatches  <- grepl("coal", SCCsource$Short.Name, ignore.case=TRUE)

subsetSCCsource <- SCCsource[coalMatches, ]
aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetSCCsource, sum)

png("plot4.png", width=640, height=480)

g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))

g <- g + geom_bar(stat="identity") +
+     xlab("year") +
+     ylab(expression('Total PM'[2.5]*" Emissions")) +
+     ggtitle('Total Emissions from coal sources from 1999 to 2008')

print(g)
dev.off()
