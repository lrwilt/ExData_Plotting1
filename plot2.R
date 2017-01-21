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
png(file = "plot2.png", width = 480, height = 480)

#Create Global Active Power Time Series
with(household_subset, plot(DateTime, Global_active_power, type = "l",
                            ylab = "Global Active Power (kilowatts)",
                            xlab = NULL))

#Save file
dev.off()