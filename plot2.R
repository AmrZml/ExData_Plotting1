setwd("../Data")

#read the first two row to know the header names
subdata <- read.table("household_power_consumption.txt",sep=";", na.strings ="?",header=T, nrows=2)
name <- names(subdata)

# read the Data from the dates 2007-02-01 and 2007-02-02
Data <- read.table("household_power_consumption.txt",sep=";", na.strings ="?",skip=66637,nrows=2880)
names(Data)<-name

# connect the date and time
Tm<- paste(Data$Date,Data$Time)
TmDate <- strptime(Tm,"%d/%m/%Y %H:%M:%S")

# create the second plot datetime and  Global_active_power
png("plot2.png",height=480,width=480)

plot(TmDate,Data$Global_active_power,type="l",xlab ="DateTime",ylab="Global Active Power(kilowatts)")
dev.off()
