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

# create the third plot
# date time and all sun metering
png("plot3.png",height=480,width=480)
plot(TmDate,Data$Sub_metering_1,col = "black",type="l",xlab="Time",ylab="Energy Sub Metering")
lines(TmDate,Data$Sub_metering_2,col = "red")
lines(TmDate,Data$Sub_metering_3,col = "blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)


dev.off()
