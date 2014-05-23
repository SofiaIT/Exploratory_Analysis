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

#°°°°°°°°°°°°#
# QUESTION 1 #
#°°°°°°°°°°°°#

# Have total emission from PM2.5 decreased in the United States from 1999 to 2008 ?

# I make a plot with the R's base plotting system to answer this question.

plot(Emissions ~ year, data=NEI.total, type="l", ylab="Emissions of PM2.5", xlab="Years",
main="Total PM2.5 emission from 1999 to 2008")


## I create the file.png

png(filename = "plot1.png", width = 480, height = 480)

plot(Emissions ~ year, data=NEI.total, type="l", ylab="Emissions of PM2.5", xlab="Years",
main="Total PM2.5 emission from 1999 to 2008")

dev.off()





