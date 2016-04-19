#reads the data and saves plot3.png to the working directory

source("readdata.R")
dt <- readdata()
png("plot3.png", width = 480, height = 480, units = "px")
plot(dt$DateTime, dt$Sub_metering_1, type ="l", xlab = "", ylab = "Energy sub metering")
points(dt$DateTime, dt$Sub_metering_2, type ="l", col = "red")
points(dt$DateTime, dt$Sub_metering_3, type ="l", col = "blue")
legend("topright", lty = 1,
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
