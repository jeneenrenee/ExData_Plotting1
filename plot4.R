if ( !file.exists("household_power_consumption.txt")) {
    print ("downloading data")
    url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(url, "data.zip")
    unzip("data.zip")
}
print("reading data")
dat <- read.csv("household_power_consumption.txt",sep=";", na.strings="?")[66637:69516,]
dat$DateTime <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")
library(datasets)
png(file="plot4.png", height=480, width=480)
par(mfcol=c(2,2))
with(dat, plot(DateTime,Global_active_power,ylab="Global Active Power (kilowatts)", type="l"))
with(dat, plot(DateTime,Sub_metering_1, ylab="Energy sub metering",type="l"))
with(dat, points(DateTime,Sub_metering_2,type="l",col='red'))
with(dat, points(DateTime,Sub_metering_3,type="l",col='blue'))
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"), cex=.75)
with(dat, plot(DateTime,Voltage, type="l"))
with(dat, plot(DateTime,Global_reactive_power, type="l"))
dev.off()