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

# I subset NEI dataset into the following four datasets of my interest.

NEI.1999 <- subset(NEI, year=="1999")
NEI.2002 <- subset(NEI, year=="2002")
NEI.2005 <- subset(NEI, year=="2005")
NEI.2008 <- subset(NEI, year=="2008")

# I merge the datasets above into a unique dataset called NEI.total.

NEI.total <- rbind(NEI.1999, NEI.2002, NEI.2005, NEI.2008)
row.names(NEI.total) <- NULL

# I select only Baltimore City, Maryland

NEI.Baltimore <- subset(NEI.total, fips=="24510")
row.names(NEI.Baltimore) <- NULL

# I omit the missing values from my data set.

NEI.Baltimore <- na.omit(NEI.Baltimore)


#°°°°°°°°°°°°#
# QUESTION 3 #
#°°°°°°°°°°°°#

# Of the four types of sources indicated by the type (point, nonpoint, onroad,
# nonroad )variable, which of these four sources have seen decreases in emissions 
# from 1999-2008 for Baltimore City ? Which have seen increases in emissions from 
# 1999-2008 ?
# Use the ggplot2 plotting system to make a plot answering this question.

# I make a plot by using the R's ggplot2 plotting system to answer this question.

# I open ggplots library and I go to see factor label information.

library(ggplot2)
str(NEI.Baltimore)

# I make a plot by group (point, nonpoint, onroad, nonroad) by using facets.

qplot(year, log(Emissions), data=NEI.Baltimore, geom=c("point", "smooth"),
method="lm", facets = .~ type)


## I create the file.png

png(filename = "plot3.png", width = 480, height = 480)

qplot(year, log(Emissions), data=NEI.Baltimore, geom=c("point", "smooth"),
method="lm", facets = .~ type)

dev.off()




