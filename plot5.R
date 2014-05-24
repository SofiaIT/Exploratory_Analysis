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

# I select only motor vehicle sources

NEI.Baltimore <- subset(NEI.Baltimore, type=="ON-ROAD")
row.names(NEI.Baltimore) <- NULL

# I omit the missing values from my data set.

NEI.Baltimore <- na.omit(NEI.Baltimore)


#°°°°°°°°°°°°#
# QUESTION 5 #
#°°°°°°°°°°°°#

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City ?

# I make a plot by using the R's ggplot2 plotting system to answer this question.

# I open ggplots library.

library(ggplot2)
str(NEI.Baltimore)

# I make a plot in order to see the change of the PM2.5 emissions from motor vehicles 
# within each year.

g <- ggplot(NEI.Baltimore, aes(x=log(Emissions), y=type)) 

summary(g)

g  +  geom_point(color = "steelblue", size = 4, alpha = 1/2) +  
geom_smooth(size=2, linetype = 3, se= FALSE, method = "lm") + facet_grid(.~ year) + 
labs(title = "PM2.5 emissions from motor vehicles in baltimore") +
labs(x = expression("log"*PM[2.5]), y = "motor vehicles")


## I create the file.png

png(filename = "plot5.png", width = 480, height = 480)

g <- qplot(NEI.Baltimore, aes(x=log(Emissions), y=type))
 
g  +  geom_point(color = "steelblue", size = 4, alpha = 1/2) +  
geom_smooth(size=2, linetype = 3, se= FALSE, method = "lm") + facet_grid(.~ year) + 
labs(title = "PM2.5 emissions from motor vehicles in baltimore") +
labs(x = expression("log"*PM[2.5]), y = "motor vehicles")

dev.off()



