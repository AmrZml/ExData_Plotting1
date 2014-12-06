setwd("../Data")

#read the first two row to know the header names
subdata <- read.table("household_power_consumption.txt",sep=";", na.strings ="?",header=T, nrows=2)
name <- names(subdata)

# read the Data from the dates 2007-02-01 and 2007-02-02
Data <- read.table("household_power_consumption.txt",sep=";", na.strings ="?",skip=66637,nrows=2880)
names(Data)<-name

# create the plot1 
# histgram of Global_active_power from 2007-02-01 to 2007-02-02

png("plot1.png",height=480,width=480)
with(Data,hist(Global_active_power,col="red"))
dev.off()
