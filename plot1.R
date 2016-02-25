plot1 <- function()
{
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "household_power_comsumption.zip")
  hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
  hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
  hpc$Time <- strptime(hpc$Time,format = "%H:%M:%S")
  hpcfiltered <- subset(hpc, (Date == as.Date("2007-02-01") | Date == as.Date("2007-02-2") ) )
  png(filename="plot1.png")
  with(hpcfiltered,hist(Global_active_power,main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red"))
  dev.off()
  
}