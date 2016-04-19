#reads the data and saves plot1.png to the working directory

source("readdata.R")
dt <- readdata()
png("plot1.png", width = 480, height = 480, units = "px")
hist(dt$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
