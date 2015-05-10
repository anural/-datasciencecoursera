library(sqldf)
file<-"data/household_power_consumption.txt"
png(filename = "plot3.png",width =480,height = 480,units = "px")
hpcData<-read.csv.sql(file,sql='select * from file where Date="1/2/2007" OR Date="2/2/2007"',sep=";")


temp<-paste(hpcData$Date,hpcData$Time,sep = " ")
hpcData$Time<-strptime(temp,format="%d/%m/%Y %H:%M:%S")
rm(temp) #remove temp

plot(hpcData$Time,hpcData$Sub_metering_1,type = "l", ylab = "Energy sub metering",xlab = '',col='black')
lines(hpcData$Time,hpcData$Sub_metering_2,col='red')
lines(hpcData$Time,hpcData$Sub_metering_3,col='blue')

legend('topright', legend=c(names(hpcData)[7], names(hpcData)[8],names(hpcData)[9]),lty= c(1,1),col=c("black", "red","blue"))
dev.off()