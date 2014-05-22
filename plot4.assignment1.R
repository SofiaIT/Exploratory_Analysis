################
#    PLOT 4    #
################


# I set my working directory

setwd("C:/Documents and Settings/Sofia Cividini/Desktop")

# I read only the rows of my interest (from 2007-02-01 to 2007-02-02)

hpc <- read.table("household_power_consumption.txt",
skip = 66637, nrow = 2880, sep = ";", 
col.names = colnames(read.table("household_power_consumption.txt",nrow = 1, 
header = TRUE, sep=";")))
hpc

## hpc<-edit(hpc)

## I create the variable Date.Time

Date.Time <- c(paste(hpc$Date, hpc$Time))
Date.Time

## I add the variable Date.Time to my data frame hpc

hpc <- data.frame(hpc,Date.Time)
hpc

## hpc<-edit(hpc)

## I do the plot 

## I divide the graph window into two rows and two columns

par(mfrow=c(2,2))

# plot1
plot(Global_active_power ~ Date.Time, data=hpc, type="l", ylab="Global Active Power", 
     xaxt = "n", xlab="")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))

# plot2
plot(Voltage ~ Date.Time, data=hpc, type="l", ylab="Voltage", 
     xaxt = "n", xlab="dateline")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))

# plot3
plot(Sub_metering_1 ~ Date.Time, data=hpc, type="l", col="black", ylab="Energy sub metering", 
     xaxt = "n", xlab="")
lines(Sub_metering_2 ~ Date.Time, data=hpc, type="l", col="red")
lines(Sub_metering_3 ~ Date.Time, data=hpc, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1,
col=c("black","red","blue"))
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))

# plot4
plot(Global_reactive_power ~ Date.Time,data=hpc, type="l", ylab="Global_reactive_power", 
     xaxt = "n", xlab="datetime")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))



## I create the file.png

png(filename = "plot3.png", width = 480, height = 480)

par(mfrow=c(2,2))

# plot1
plot(Global_active_power ~ Date.Time, data=hpc, type="l",
     ylab="Global Active Power", xaxt = "n", xlab="")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))

# plot2
plot(Voltage ~ Date.Time, data=hpc, type="l",
     ylab="Voltage", xaxt = "n", xlab="dateline")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))

# plot3
plot(Sub_metering_1 ~ Date.Time, data=hpc, type="l", col="black", ylab="Energy sub metering", 
     xaxt = "n", xlab="")
lines(Sub_metering_2 ~ Date.Time, data=hpc, type="l", col="red")
lines(Sub_metering_3 ~ Date.Time, data=hpc, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1,
col=c("black","red","blue"))
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))

# plot4
plot(Global_reactive_power ~ Date.Time,data=hpc, type="l",
     ylab="Global_reactive_power", xaxt = "n", xlab="datetime")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))


dev.off()







