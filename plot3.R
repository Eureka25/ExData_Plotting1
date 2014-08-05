#R code to produce Graph 3 for Course Project 1 for Exploratory Data Analysis

#Load data assuming data is in current working directory
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#take the required subset of the data					      
data = data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

#rename the rows after subsetting
rownames(data) <- 1:2880

#get a date/timestamp for each row
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

#get the correct type for the submetering values
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

#start the graphics device in the current working directory
png("./plot3.png", width = 480, height = 480)

#plot the required graph 

#set up the base graph
plot(data$DateTime, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energt sub metering")

#add the 3 sub metering lines
lines(data$DateTime, data$Sub_metering_1, col = "black")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")

#add the legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1) 

dev.off()