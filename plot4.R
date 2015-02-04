filename = "exdata-data-household_power_consumption.zip"

###  Reading the data from the zip file
HHPower = read.csv(unz(filename, "household_power_consumption.txt"), header=T,
                   sep=";", stringsAsFactors=F, na.strings="?",
                   colClasses=c("character", "character", rep("numeric",7)))


HHPower$timestamp = strptime(paste(HHPower$Date, HHPower$Time),
                             format="%d/%m/%Y %H:%M:%S", tz="UTC")
startDate = strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC")
endDate = strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S", tz="UTC")
HHPower = HHPower[HHPower$timestamp >= startDate & HHPower$timestamp <= endDate, ]


## Creating plot #4
png(filename="plot4.png", width=480, height=480)

# 4 plots in the figure(i.e. 2 rows and 2 columns)
par(mfcol=c(2,2))


# plot # 1
plot(HHPower$timestamp, HHPower$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# plot # 2
plot(HHPower$timestamp, HHPower$Sub_metering_1, xlab="",
     ylab="Energy sub metering",type="l")
lines(HHPower$timestamp, HHPower$Sub_metering_2, col="red")
lines(HHPower$timestamp, HHPower$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=par("lwd"), bty="n")

# plot # 3
plot(HHPower$timestamp, HHPower$Voltage,
     xlab="datetime", ylab="Voltage", type="l")

# plot # 4
plot(HHPower$timestamp, HHPower$Global_reactive_power,
     xlab="datetime", ylab="Global_reactive_power", type="l")
dev.off()

