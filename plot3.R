#Load household power consumption data
household_power<- read.delim("household_power_consumption.txt", header = TRUE,
                             sep = ";", na.strings = "?")

#Put Date & time fields in Date and time Types
household_power$DateTime <- paste(household_power$Date, household_power$Time)
household_power$Date <- as.Date(household_power$Date, format = "%d/%m/%Y")
household_power$DateTime <- as.POSIXct(household_power$DateTime,
                                       format = "%d/%m/%Y %T")

#Subset data
household_subset <- subset(household_power,
                           subset = household_power$Date >= "2007/02/01" &
                               household_power$Date <= "2007/02/02")

#Save and name file
png(file = "plot3.png", width = 480, height = 480)

#Create Time Series of Sub Metering variables
with(household_subset, plot(DateTime, Sub_metering_1, type = "l",
                            ylab = "Energy sub metering",
                            xlab = NULL))
with(household_subset,lines(DateTime, Sub_metering_2, type = "l", col = "red"))
with(household_subset,lines(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = c(1,1,1))

#Save file
dev.off()