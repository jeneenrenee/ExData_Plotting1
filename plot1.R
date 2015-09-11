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
png(file="plot1.png", height=480, width=480)
hist(dat$Global_active_power, col='red',xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
