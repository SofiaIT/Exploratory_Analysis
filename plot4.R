####################
#   ASSIGNMENT 2   #
####################


# I set my working directory.

setwd("C:/Documents and Settings/Sofia Cividini/Desktop")


# I open the "Source_Classification_Code.rds" dataset in reading.

SCC<- readRDS("Source_Classification_Code.rds")
SCC <- edit(SCC)


# I select the SCC variables related to the coal combustion sources through 
# opportune key words that seem to match to this kind of sources, and I use 
# the key words into the third variable (Short.Name) 

# I found 204 possible pollutant sources linked to coal emissions. 

# I decided to include all the several activities which are involved in the coal
# use, even if the word 'coal' is only in the activity's name, because they are 
# probably pollutant sources from coal combustion in any way.


SCC.coal <- SCC[
   grepl("coal", SCC$SCC.Level.Three, ignore.case=TRUE) |
   grepl("lignite", SCC$SCC.Level.Three, ignore.case=TRUE)|
   grepl("anthracite", SCC$SCC.Level.Three, ignore.case=TRUE)|
   grepl("coal-based", SCC$SCC.Level.Three, ignore.case=TRUE), ]
row.names(SCC.coal) <- NULL
SCC.coal<- edit(SCC.coal)

# I create a list from SCC.coal to use to select the observations from NEI.total below

ID <- c(SCC.coal[1])
class(ID)      # a list
length(ID$SCC) # my 204 observations


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

# I select only emissions from coal combustion-related sources. 

NEI.total <- subset(NEI.total, SSC %in% "ID")
row.names(NEI.total) <- NULL


#°°°°°°°°°°°°#
# QUESTION 4 #
#°°°°°°°°°°°°#

# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999-2008 ?

# I make a plot by using the R's base plotting system to answer this question.

plot(Emissions ~ year, data=NEI.total, type="l", ylab="Emissions of PM2.5 from coal combustion", xlab="Years",
main="Total PM2.5 emission from coal combustion-related sources from 1999-2008 in the U.S.A ")


## I create the file.png

png(filename = "plot4.png", width = 480, height = 480)

plot(Emissions ~ year, data=NEI.total, type="l", ylab="Emissions of PM2.5 from coal combustion", xlab="Years",
main="Total PM2.5 emission from coal combustion-related sources from 1999-2008 in the U.S.A ")


dev.off()


