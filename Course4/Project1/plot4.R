library(sqldf)
file<-"data/household_power_consumption.txt"
png(filename = "plot4.png",width =480,height = 480,units = "px")
#getting only the necessary part of the file
hpcData<-read.csv.sql(file,sql='select * from file where Date="1/2/2007" OR Date="2/2/2007"',sep=";")


temp<-paste(hpcData$Date,hpcData$Time,sep = " ")
hpcData$Time<-strptime(temp,format="%d/%m/%Y %H:%M:%S")
rm(temp) #remove temp

#plot in 2 rows,2 columns
par(mfrow=c(2,2))

#plot upper-left
plot(hpcData$Time,hpcData$Global_active_power,type = "l", ylab = "Global Active Power (kilowatts)",xlab = '')

#plot upper-right
plot(hpcData$Time,hpcData$Voltage,type = "l", ylab = "Voltage",xlab = 'datetime')

#plot lower-left
plot(hpcData$Time,hpcData$Sub_metering_1,type = "l", ylab = "Energy sub metering",xlab = '',col='black')
lines(hpcData$Time,hpcData$Sub_metering_2,col='red')
lines(hpcData$Time,hpcData$Sub_metering_3,col='blue')
legend('topright', legend=c(names(hpcData)[7], names(hpcData)[8],names(hpcData)[9]),lty= c(1,1),col=c("black", "red","blue"),bty="n")

#plot lower-right
plot(hpcData$Time,hpcData$Global_reactive_power,type = "l", ylab = "Global_reactive_power",xlab = 'datetime')
dev.off()