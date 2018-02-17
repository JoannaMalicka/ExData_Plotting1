#file "mydata.txt" contains only data for relevant days: February 1st and February 2nd 2007

#1. loading data
mydata <- read.table("mydata.txt", header = TRUE, sep=";")

#2. transforming into date and time format
mytime <- paste(mydata$Date, mydata$Time, sep = " ")
mytime <- strptime(mytime, "%d/%m/%Y %H:%M:%S")
mydata <- cbind(mytime, mydata)

#3. printing a graph
par(mfrow = c(2,2), mar = c(4, 4, 2, 1))
plot(mydata$mytime, mydata$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")
plot(mydata$mytime, mydata$Voltage, type = "l", 
     ylab = "", xlab = "datetime")
plot(mydata$mytime, mydata$Sub_metering_1, type = "l",
     xlab = "voltage", ylab = "Energy sub metering")
lines(mydata$mytime, mydata$Sub_metering_2, type="l", col = "red")
lines(mydata$mytime, mydata$Sub_metering_3, type="l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       bty = "n")
plot(mydata$mytime, mydata$Global_active_power, type = "l", 
     ylab = "global_reactive_power", xlab = "datetime")

#4. Saving as a png file
dev.copy(png, "plot4.png")
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), mar = c(4, 4, 2, 1))
plot(mydata$mytime, mydata$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")
plot(mydata$mytime, mydata$Voltage, type = "l", 
     ylab = "", xlab = "datetime")
plot(mydata$mytime, mydata$Sub_metering_1, type = "l",
     xlab = "voltage", ylab = "Energy sub metering")
lines(mydata$mytime, mydata$Sub_metering_2, type="l", col = "red")
lines(mydata$mytime, mydata$Sub_metering_3, type="l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       bty = "n")
plot(mydata$mytime, mydata$Global_active_power, type = "l", 
     ylab = "global_reactive_power", xlab = "datetime")
dev.off()