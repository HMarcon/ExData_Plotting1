#Read raw data
data <- read.table("household_power_consumption.txt", header = TRUE, 
                   sep = ";", na.strings = "?")

# Concatante Date and Time variables
data$dateTime = paste(data$Date, data$Time)

# Convert to Date/Time class
data$dateTime <- strptime(data$dateTime, "%d/%m/%Y %H:%M:%S")

#Subsetting! 
data_subset <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

#Create plot
png("plot3.png", width=480, height=480, units="px")

leg <- c("black", "red", "blue")

plot(data_subset$Sub_metering_1, type = "l", col = leg[1], xlab = "",
     ylab = "Energy sub metering")
lines(data_subset$Sub_metering_2, col = leg[2])
lines(data_subset$Sub_metering_3, col = leg[3])
legend("topright", col = leg, lty = 2,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))



dev.off()