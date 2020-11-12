#file reading and adding of a new datetime type column

power <- read.delim("household_power_consumption.txt", sep = ";")
power <- subset(power, power$Date == "1/2/2007" | power$Date == "2/2/2007")
datetime <- as.POSIXct(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")
power <- cbind(power,  datetime)

#plot and save as png of size 480x480 pixels

png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2), mar = c(4,4,1,1))

#Plot 1
with(power, plot(datetime, Global_active_power, xlab = "", ylab = 
                         "Global Active Power", type = "l"))

#Plot 2
with(power, plot(datetime, Voltage, ylab = 
                         "Voltage", type = "l"))

#Plot 3
with(power, plot(datetime, Sub_metering_1, xlab = "", ylab = "Energy sub metering",
                 type ="n"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, col = c("black","red","blue"), bty = "n")
with(power,points(datetime, Sub_metering_1, type = "l", col = "black"))
with(power,points(datetime, Sub_metering_2, type = "l", col = "red"))
with(power,points(datetime, Sub_metering_3, type = "l", col = "blue"))

#Plot 4
with(power, plot(datetime, Global_reactive_power, type = "l", lwd = ))
dev.off()

