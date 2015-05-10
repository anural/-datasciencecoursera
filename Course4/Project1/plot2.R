library(sqldf)
file<-"data/household_power_consumption.txt"
png(filename = "plot2.png",width =480,height = 480,units = "px")
hpcData<-read.csv.sql(file,sql='select * from file where Date="1/2/2007" OR Date="2/2/2007"',sep=";")


temp<-paste(hpcData$Date,hpcData$Time,sep = " ")
hpcData$Time<-strptime(temp,format="%d/%m/%Y %H:%M:%S")
rm(temp) #remove temp

plot(hpcData$Time,hpcData$Global_active_power,type = "l", ylab = "Global Active Power (kilowatts)",xlab = '')
dev.off()