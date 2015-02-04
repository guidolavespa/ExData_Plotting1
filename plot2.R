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


## Creating plot #2
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "transparent")
plot(HHPower$timestamp, HHPower$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
