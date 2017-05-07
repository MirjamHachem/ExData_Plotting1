# This is the R script for the fourth png file containing four plots 

# Reading the data set into R
power_consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

# Subsetting the rows with the relevant dates: 1st and 2nd of February 2007
subset_power_consumption <- power_consumption[power_consumption$Date %in% c("1/2/2007", "2/2/2007"),]

# Creating the variable for the x-axis for all four plots by Converting the variables Date and Time from character strings into date and time formats and pasting them together.
date_time_merged <- strptime(paste(subset_power_consumption$Date, subset_power_consumption$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

# Creating the variable for the y-axis for the top left plot by storing Global_active_power in a numeric vector.
Global_active_power <- as.numeric(subset_power_consumption$Global_active_power)

# Creating the variable for the y-axis for the top right plot by storing Voltage in a numeric vector.
Voltage <- as.numeric(subset_power_consumption$Voltage)

# Creating the variable for the y-axis for the left bottom plot by storing the variables related to submetering in numeric vectors.
Sub_metering_1 <- as.numeric(subset_power_consumption$Sub_metering_1)
Sub_metering_2 <- as.numeric(subset_power_consumption$Sub_metering_2)
Sub_metering_3 <- as.numeric(subset_power_consumption$Sub_metering_3)

# Creating the variable for the y-axis for the right bottom plot by storing the variable Global_reactive_power in a numeric vector.
Global_reactive_power <- as.numeric(subset_power_consumption$Global_reactive_power)

# Creating the PNG file
png("plot4.png", width=480, height= 480)

# Creating a space with 2 column and 2 rows
par(mfrow = c(2,2))


# Creating the plots

# Top left
plot(date_time_merged, Global_active_power, type = "l", xlab="", ylab = "Global Active Power")

# Top right
plot(date_time_merged, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Bottom left
plot(date_time_merged, Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
lines(date_time_merged, Sub_metering_2, type = "l", col = "red")
lines(date_time_merged, Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2, lty = 1, col = c("black", "red", "blue"))

# Bottom right
plot(date_time_merged, Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")

# Closing the plotting procedure
dev.off()


# Thank you for grading my assignment! :-)