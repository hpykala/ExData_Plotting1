#reads the data and saves plot4.png to the working directory

source("readdata.R")
dt <- readdata()
png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))

plot(dt$DateTime, dt$Global_active_power,type="l",xlab = "", ylab = "Global Active Power (kilowatts)")

plot(dt$DateTime, dt$Voltage, type="l",xlab = "datetime", ylab = "Voltage")

plot(dt$DateTime, dt$Sub_metering_1, type ="l", xlab = "", ylab = "Energy sub metering")
points(dt$DateTime, dt$Sub_metering_2, type ="l", col = "red")
points(dt$DateTime, dt$Sub_metering_3, type ="l", col = "blue")
legend("topright", lty = 1, bty = "n",
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(dt$DateTime, dt$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
