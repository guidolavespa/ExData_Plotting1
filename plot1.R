filename = "exdata-data-household_power_consumption.zip"

###  Reading the data from the zip file
HHPower = read.csv(unz(filename, "household_power_consumption.txt"), header=T,
                    sep=";", stringsAsFactors=F, na.strings="?",
                    colClasses=c("character", "character", rep("numeric",7)))

## subset from 2007-02-01 to 2007-02-02
HHPower$Date = as.Date( HHPower$Date, format="%d/%m/%Y")
startDate = as.Date("01/02/2007", format="%d/%m/%Y")
endDate = as.Date("02/02/2007", format="%d/%m/%Y")
HHPower = HHPower[HHPower$Date >= startDate & HHPower$Date <= endDate, ]

## Creating plot #1
png(filename="plot1.png", width=480, height=480)
hist(HHPower$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red")
dev.off()

