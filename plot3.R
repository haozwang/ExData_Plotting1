## reading the data ##

df<-fread("household_power_consumption.txt",header=FALSE,skip="1/2/2007",nrows=2880,colClass="numeric")
setnames(df, c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))



## combining date time to a new column

library(lubridate)

mydate<-paste(Date, Time)
mydate <- dmy_hms(mydate)
names(mydate) = "DatesTime"

df[,DatesTime:=mydate]


## create and export the graph the graph

library(datasets)


png(file="plot3.png", width = 480, height = 480)

plot(df$DatesTime, df$Sub_metering_1,type="l", ylab="Energy sub metering", xlab="")
lines(df$DatesTime, df$Sub_metering_2,type = "l", col="red")
lines(df$DatesTime, df$Sub_metering_3,type = "l", col="blue")
legend("topright",col = c("black","red","blue"),lty=c(1,1,1),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


dev.off()
