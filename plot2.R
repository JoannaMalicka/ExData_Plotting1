#file "mydata.txt" contains only data for relevant days: February 1st and February 2nd 2007

#1. loading data
mydata <- read.table("mydata.txt", header = TRUE, sep=";")

#2. transforming into date and time format
mytime <- paste(mydata$Date, mydata$Time, sep = " ")
mytime <- strptime(mytime, "%d/%m/%Y %H:%M:%S")
mydata <- cbind(mytime, mydata)

#3. printing a graph
plot(mydata$mytime, mydata$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")

#4. Saving as a png file
dev.copy(png, "plot2.png")
png("plot2.png", width = 480, height = 480)
plot(mydata$mytime, mydata$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()

