### Exploratory data analysis project 1
# plot 2

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
d1$Global_active_power=as.numeric(d1$Global_active_power)

# plot
with(d1, plot(x,d1$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")) 

# Copy plot to a PNG file
dev.copy(png, file = "plot2.png")

# close the PNG device
dev.off()  