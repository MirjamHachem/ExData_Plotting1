# This is the R script for the third PNG file containing one plot 

# Reading the data set into R
power_consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

# Subsetting the rows with the relevant dates: 1st and 2nd of February 2007
subset_power_consumption <- power_consumption[power_consumption$Date %in% c("1/2/2007", "2/2/2007"),]

# Creating the variable for the y-axis by storing the variables related to submetering in numeric vectors.
Sub_metering_1 <- as.numeric(subset_power_consumption$Sub_metering_1)
Sub_metering_2 <- as.numeric(subset_power_consumption$Sub_metering_2)
Sub_metering_3 <- as.numeric(subset_power_consumption$Sub_metering_3)

# Creating the variable for the x-axis by Converting the variables Date and Time from character strings 
# into date and time formats and pasting them together.
date_time_merged <- strptime(paste(subset_power_consumption$Date, subset_power_consumption$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

# Creating the PNG file
png("plot3.png", width=480, height= 480)

# Creating the plot
plot(date_time_merged, Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
lines(date_time_merged, Sub_metering_2, type = "l", col = "red")
lines(date_time_merged, Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2, lty = 1, col = c("black", "red", "blue"))

# Closing the plotting procedure
dev.off()


# Thank you for grading my assignment! :-)
