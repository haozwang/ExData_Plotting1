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


png(file="plot4.png", width = 480, height = 480)


par(mfrow = c(2,2))

# panel 1 (top left)

plot(df$DatesTime, df$Global_active_power,type="l", ylab="Global Active Power", xlab="")

# panel 2 (top right)

plot(df$DatesTime, df$Voltage,type="l", ylab="Voltage", xlab="datetime")

# panel 3 (bot left)

plot(df$DatesTime, df$Sub_metering_1,type="l", ylab="Energy sub metering", xlab="")
lines(df$DatesTime, df$Sub_metering_2,type = "l", col="red")
lines(df$DatesTime, df$Sub_metering_3,type = "l", col="blue")
legend("topright",col = c("black","red","blue"),lty=c(1,1,1), bty="n",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


# panel 4 (bot right)

plot(df$DatesTime, df$Global_reactive_power,type="l", xlab="datetime")


dev.off()
