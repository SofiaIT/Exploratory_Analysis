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

# I drop the Emission variable's value equal to zero in order to do log(Emissions)
# for the plot

NEI.Baltimore <- subset(NEI.Baltimore, Emissions!=0)
NEI.Baltimore <- edit(NEI.Baltimore)



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

g <- ggplot(NEI.Baltimore, aes(x=year, y=log(Emissions), fill=type)) 

summary(g)

g  +  geom_point(color = "steelblue", size = 4, alpha = 1/2) +  
geom_smooth(method = "lm") + facet_grid(.~ type) + 
labs(title = "PM2.5 emissions in Baltimore from 1999 to 2008") +
labs(x = "years" , y = expression("log"*PM[2.5])) +
scale_x_continuous(limits=c(1998,2009), breaks=seq(1999,2008,3))

# alternative way
# scale_x_continuous(limits=c(1998,2009), breaks=c(1999,2002,2005,2008), labels=c("1999","2002","2005","2008")) 


# I create the file.png

png(filename = "plot3.png", width=800, height=489)

g <- ggplot(NEI.Baltimore, aes(x=year, y=log(Emissions), fill=type)) 

g  +  geom_point(color = "steelblue", size = 4, alpha = 1/2) +  
geom_smooth(method = "lm") + facet_grid(.~ type) + 
labs(title = "PM2.5 emissions in Baltimore from 1999 to 2008") +
labs(x = "years" , y = expression("log"*PM[2.5])) +
scale_x_continuous(limits=c(1998,2009), breaks=seq(1999,2008,3))

dev.off()



