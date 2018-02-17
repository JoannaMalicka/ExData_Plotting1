#file "mydata.txt" contains only data for relevant days: February 1st and February 2nd 2007

#1. loading data
mydata <- read.table("mydata.txt", header = TRUE, sep=";")

#2. transforming into date and time format
mytime <- paste(mydata$Date, mydata$Time, sep = " ")
mytime <- strptime(mytime, "%d/%m/%Y %H:%M:%S")
mydata <- cbind(mytime, mydata)

#3. printing a graph
plot(mydata$mytime, mydata$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(mydata$mytime, mydata$Sub_metering_2, type="l", col = "red")
lines(mydata$mytime, mydata$Sub_metering_3, type="l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#4. Saving as a png file
dev.copy(png, "plot3.png")
png("plot3.png", width = 480, height = 480)
plot(mydata$mytime, mydata$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(mydata$mytime, mydata$Sub_metering_2, type="l", col = "red")
lines(mydata$mytime, mydata$Sub_metering_3, type="l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

