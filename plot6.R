####################
#   ASSIGNMENT 2   #
####################


# I set my working directory.

setwd("C:/Documents and Settings/Sofia Cividini/Desktop")

# I open the "Source_Classification_Code.rds" dataset in reading.

source <- readRDS("Source_Classification_Code.rds")
source <- edit(source)

# I open the "summarySCC_PM25.rds" dataset in reading.

NEI <- readRDS("summarySCC_PM25.rds")

# I go to see how the four categories of type variable were written.

factor(NEI$type)


# I subset NEI dataset into the following four datasets of my interest.

NEI.1999 <- subset(NEI, year == "1999")
NEI.2002 <- subset(NEI, year == "2002")
NEI.2005 <- subset(NEI, year == "2005")
NEI.2008 <- subset(NEI, year == "2008")


# I merge the datasets above into a unique dataset called NEI.total.

NEI.total <- rbind(NEI.1999, NEI.2002, NEI.2005, NEI.2008)


# I select Baltimore City, Maryland. 

NEI.Baltimore <- subset(NEI.total, fips == "24510")


# I select Los Angeles County, California.

NEI.LosAngeles <- subset(NEI.total, fips == "06037")


# I merge the two datasets above into a unique dataset called NEI.cities.

NEI.cities <- rbind(NEI.Baltimore, NEI.LosAngeles)


# I select only motor vehicle sources.

NEI.cities <- subset(NEI.cities, type == "ON-ROAD")



#°°°°°°°°°°°°#
# QUESTION 6 #
#°°°°°°°°°°°°#

# Compare emissions from motor vehicle sources between Baltimore City and Los Angeles County over time.

# I make a plot by using the R's ggplot2 plotting system to answer this question.

# I open ggplots library.

library(ggplot2)
str(NEI.cities)


# I make a basic plot in order to see the change of the PM2.5 emissions from motor vehicles over time within each city.

g <- ggplot(NEI.cities, aes(Emissions, type))
g + geom_point() + facet_grid(. ~ fips) + geom_smooth(method = "lm") + 
labs(title = "Baltimore City vs Los Angeles County") + labs(x = "PM2.5 Emission", y = "Motor Vehicle Sources") 

## I create the file.png

png(filename = "plot6.png", width = 480, height = 480)

g <- ggplot(NEI.cities, aes(Emissions, type))
g + geom_point() + facet_grid(. ~ fips) + geom_smooth(method = "lm") + 
labs(title = "Baltimore City vs Los Angeles County") + labs(x = "PM2.5 Emission", y = "Motor Vehicle Sources") 


dev.off()

