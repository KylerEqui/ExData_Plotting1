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

hist(plot_df$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off