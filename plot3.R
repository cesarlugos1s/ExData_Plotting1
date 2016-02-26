plot3 <- function()
{
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "household_power_comsumption.zip")
  unzip("household_power_comsumption.zip")
  hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
  hpc$Time <- strptime(paste(hpc$Date,hpc$Time),format = "%d/%m/%Y%H:%M:%S")
  hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
  hpcfiltered <- subset(hpc, (Date == as.Date("2007-02-01") | Date == as.Date("2007-02-2") ) )
  hpcfiltered$dayofweek <- as.POSIXlt(hpcfiltered$Date)$wday
  png(filename="plot3.png")
  with(hpcfiltered,plot(Time,Sub_metering_1,type = "l",xlab="",ylab = "Energy sub mettering", col = "grey"))
  lines(hpcfiltered$Time,hpfcfiltered$Sub_metering_2,hpcfiltered$Sub_metering_2, col = "red", type = "l")
  lines(hpcfiltered$Time,hpfcfiltered$Sub_metering_3,hpcfiltered$Sub_metering_2, col = "blue", type = "l")
  legend("topright",c("Sub_mettering_1","Sub_mettering_2","Sub_mettering_3"), col = c("gray","red","blue"), lwd = 1)
  dev.off()

}