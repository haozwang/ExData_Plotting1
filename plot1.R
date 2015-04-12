## reading the data ##

df<-fread("household_power_consumption.txt",header=FALSE,skip="1/2/2007",nrows=2880,colClass="numeric")
setnames(df, c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))




## create and export the graph the graph

library(datasets)


png(file="plot1.png", width = 480, height = 480)
hist(df$Global_active_power, main = "Global Active Power", xlab=" Global Active Power (kilowatts)", lwd="1",col="red3" )

dev.off()
