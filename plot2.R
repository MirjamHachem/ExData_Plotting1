# This is the R script for the second plot 

# Reading the data set into R
power_consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

# Subsetting the rows with the relevant dates: 1st and 2nd of February 2007
subset_power_consumption <- power_consumption[power_consumption$Date %in% c("1/2/2007", "2/2/2007"),]

# Creating the variable for the y-axis by storing the variable Global_active_power in a numeric vector
Global_active_power <- as.numeric(subset_power_consumption$Global_active_power)

# Creating the variable for the x-axis by Converting the variables Date and Time from character strings 
# into date and time formats and pasting them together.
date_time_merged <- strptime(paste(subset_power_consumption$Date, subset_power_consumption$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

# Creating the PNG file
png("plot2.png", width=480, height= 480)

# Creating the plot
plot(date_time_merged, Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")

# Closing the plotting procedure
dev.off()

# Thank you for grading my assignment! :-)
