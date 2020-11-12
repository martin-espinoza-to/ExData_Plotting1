#file reading and adding of a new datetime type column

power <- read.delim("household_power_consumption.txt", sep = ";")
power <- subset(power, power$Date == "1/2/2007" | power$Date == "2/2/2007")
datetime <- as.POSIXct(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")

#plot and save as png of size 480x480 pixels

power <- cbind(power,  datetime)
with(power, plot(datetime, Global_active_power, xlab = "", ylab = 
                         "Global Active Power (kilowatts)", type = "l"))
dev.copy(png, "plot2.png", width = 480, height = 480, units = "px")
dev.off()