################
#    PLOT 1    #
################


# I set my working directory

setwd("C:/Documents and Settings/Sofia Cividini/Desktop")

# I read only the rows of my interest (from 2007-02-01 to 2007-02-02)

hpc <- read.table("household_power_consumption.txt",
skip = 66637, nrow = 2880, sep = ";", 
col.names = colnames(read.table("household_power_consumption.txt",nrow = 1, 
header = TRUE, sep=";")))
hpc


# I create plot1

hist(hpc$Global_active_power, main="Global Active Power", col = "red",  
     ylim=c(0,1200), xlab="Global Active Power (kilowatts)")


# I create the file.png for plot 1

png(filename = "plot1.png",
    width = 480, height = 480)
hist(hpc$Global_active_power, main="Global Active Power", col = "red",  
     ylim=c(0,1200), xlab="Global Active Power (kilowatts)")
dev.off()




