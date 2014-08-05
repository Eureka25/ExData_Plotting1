#R code to produce Graph 2 for Course Project 1 for Exploratory Data Analysis

#Load data, assuming it is in current working directory
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#take the required subset of the data                                         
data = data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

#rename the rows after subsetting
rownames(data) <- 1:2880

#get a date/timestamp for each row
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

#get the correct type for the active power
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

#start the graphics device in the current working directory
png("./plot2.png", width = 480, height = 480)

#set up plot base
plot(data$DateTime, data$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")

#plot line
lines(data$DateTime, data$Global_active_power)
dev.off()