# This is the R script for the first plot Global Active Power

# Reading the data set into R
power_consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

# Subsetting the rows with the relevant dates: 1st and 2nd of February 2007
subset_power_consumption <- power_consumption[power_consumption$Date %in% c("1/2/2007", "2/2/2007"),]

# Creating the variable for the x-axis by storing the variable Global_active_power in a numeric vector
Global_active_power <- as.numeric(subset_power_consumption$Global_active_power)

# Creating the PNG file
png("plot1.png", width=480, height=480)

# Creating the histogram
hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab= "Frequency", col = "red")

# Closing the plotting procedure
dev.off()

# Thank you for grading my assignment! :-)
