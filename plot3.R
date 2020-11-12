#file reading and adding of a new datetime type column

power <- read.delim("household_power_consumption.txt", sep = ";")
power <- subset(power, power$Date == "1/2/2007" | power$Date == "2/2/2007")
datetime <- as.POSIXct(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")
power <- cbind(power,  datetime)

#plot and save as png of size 480x480 pixels

png("plot3.png", width = 480, height = 480, units = "px")
with(power, plot(datetime, Sub_metering_1, xlab = "", ylab = "Energy sub metering",
                 type ="n"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", 
                              "Sub_metering_3"), lty = 1, col = c("black","red",
                                                                  "blue"))
with(power,points(datetime, Sub_metering_1, type = "l", col = "black"))
with(power,points(datetime, Sub_metering_2, type = "l", col = "red"))
with(power,points(datetime, Sub_metering_3, type = "l", col = "blue"))
dev.off()