plot2 <- function()
{
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "household_power_comsumption.zip")
  unzip("household_power_comsumption.zip")
  hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
  hpc$Time <- strptime(paste(hpc$Date,hpc$Time),format = "%d/%m/%Y%H:%M:%S")
  hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
  hpcfiltered <- subset(hpc, (Date == as.Date("2007-02-01") | Date == as.Date("2007-02-2") ) )
  hpfcfiltered <- (na.omit(hpcfiltered))
  hpcfiltered$dayofweek <- as.POSIXlt(hpcfiltered$Date)$wday
  png(filename="plot2.png")
  with(hpcfiltered,plot(Time,Global_active_power,type = "l",xlab="",ylab = "Global Active Power (kilowatts)", col = "black"))
  dev.off()
  
}