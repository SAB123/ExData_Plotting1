### Exploratory data analysis project 1
# plot 3

library(datasets)

# open data file
d<-read.table("exdata_data_household_power_consumption.txt",sep=";", stringsAsFactors = FALSE, 
              header=TRUE, nrows=2075300, comment.char="",
              colClasses = "character",na.strings="?")

# convert date n.b. year has to be Y not y
d$Date<-as.Date(d$Date,"%d/%m/%Y")

# get required data for plot 
d1<-subset(d,d$Date=="2007-02-01" | d$Date=="2007-02-02")

# create the values for the x axis
x=seq(as.POSIXct("2007-02-01 00:00:00"),by="min",length.out=24*2*60)

# make values numeric
d1$Sub_metering_1=as.numeric(d1$Sub_metering_1)
d1$Sub_metering_2=as.numeric(d1$Sub_metering_2)
d1$Sub_metering_3=as.numeric(d1$Sub_metering_3)

# open png graphics device to send plot to
png(filename = "plot3.png",
     width = 480, height = 480, units = "px", pointsize = 12,
     bg = "white", res = NA, family = "", restoreConsole = TRUE,
     type = "windows")

# plot
plot(x,d1$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(x,d1$Sub_metering_2, col="red")
lines(x,d1$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"))

# close the PNG device
dev.off()  