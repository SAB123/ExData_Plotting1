### Exploratory data analysis project 1
# plot 1

library(datasets)

# open data file
d<-read.table("exdata_data_household_power_consumption.txt",sep=";",header=TRUE, nrows=2075300, comment.char="",colClasses = "character",na.strings="?")

# convert date n.b. year has to be Y not y
d$Date<-as.Date(d$Date,"%d/%m/%Y")

# get required data for plot - global active power, column 3 needs to be numeric
d1<-subset(d,d$Date=="2007-02-01" | d$Date=="2007-02-02")

d1$Global_active_power=as.numeric(d1$Global_active_power)

with(d1, hist(d1$Global_active_power, breaks = 12, col="red", main = "Global Active Power", 
            xlab="Global Active Power (kilowatts)", ylab="Frequency")) 
dev.copy(png, file = "plot1.png")  ## Copy plot to a PNG file
dev.off()  ## close the PNG device