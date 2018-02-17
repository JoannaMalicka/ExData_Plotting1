#file "mydata.txt" contains only data for relevant days: February 1st and February 2nd 2007

#1. loading data
mydata <- read.table("mydata.txt", header = TRUE, sep=";")

#2. printing a graph
hist(mydata$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col="red")

#3. Saving as a png
dev.copy(png, "plot1.png")
png("plot1.png", width = 480, height = 480)
hist(mydata$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col="red")
dev.off()

