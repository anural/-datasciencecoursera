library(sqldf)
file<-"data/household_power_consumption.txt"
png(filename = "plot1.png",width =480,height = 480,units = "px")

hpcData<-read.csv.sql(file,sql='select * from file where Date="1/2/2007" OR Date="2/2/2007"',sep=";")


hist(hpcData$Global_active_power,main= "Global Active Power", xlab ="Global Active Power (kilowatts)",col = "red", breaks=20)
dev.off()