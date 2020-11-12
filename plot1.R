#file reading and adding of a new datetime type column

power <- read.delim("household_power_consumption.txt", sep = ";")
power <- subset(power, power$Date == "1/2/2007" | power$Date == "2/2/2007")
datetime <- as.POSIXct(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")
power <- cbind(power,  datetime)

#plot and save as png of size 480x480 pixels

hist(as.numeric(power$Global_active_power), col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", ylim = c(0,1200))
dev.copy(png, "plot1.png", width = 480, height = 480, units = "px")
dev.off()