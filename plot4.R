epc <- read.table("household_power_consumption.txt", header = T, sep = ";")
epc$Date <- as.Date(epc$Date, format="%d/%m/%Y")
plot_df <- epc[(epc$Date=="2007-02-01") | (epc$Date=="2007-02-02"),]

plot_df$Global_active_power <- as.numeric(as.character(plot_df$Global_active_power))
plot_df$Global_reactive_power <- as.numeric(as.character(plot_df$Global_reactive_power))
plot_df$Voltage <- as.numeric(as.character(plot_df$Voltage))
plot_df$Sub_metering_1 <- as.numeric(as.character(plot_df$Sub_metering_1))
plot_df$Sub_metering_2 <- as.numeric(as.character(plot_df$Sub_metering_2))
plot_df$Sub_metering_3 <- as.numeric(as.character(plot_df$Sub_metering_3))

plot_df <- transform(plot_df, Timestamp=as.POSIXct(paste(Date,Time)), "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))


plot(plot_df$Timestamp,plot_df$Global_active_power, type = "l", xlab = "", 
    ylab = "Global Active Power")

plot(plot_df$Timestamp,plot_df$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")


plot(plot_df$Timestamp, plot_df$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(plot_df$Timestamp, plot_df$Sub_metering_2, col="red")
lines(plot_df$Timestamp, plot_df$Sub_metering_3, col="blue")
legend("topright", lty=1, bty = "n",cex = .5, col=c("black","red","blue"), 
       c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "))

plot(plot_df$Timestamp,plot_df$Global_reactive_power, type = "l", 
     xlab = "datetime" , ylab = "Global_reactive_power")

dev.copy(png, file="plot4.png", width=480, height= 480)
dev.off()




