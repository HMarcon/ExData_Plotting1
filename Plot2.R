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
png("plot2.png", width=480, height=480, units="px")
plot(data_subset$dateTime, data_subset$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kW)")
dev.off()