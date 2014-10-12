# Read and load household_power_consumption.txt file
power <- read.csv("./household_power_consumption.txt", sep = ";", header = TRUE)
#Convert the Date field from factor to Date
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
#Select only 2 days of data
power_feb <- subset(power, power$Date == as.Date("2007-02-01") | power$Date == as.Date("2007-02-02"))
#Convert field from factor to double precision
power_feb$Global_active_power <- as.numeric(as.character(power_feb$Global_active_power))
#Draw the Histogram
hist(power_feb$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = paste("Global Active Power (kilowatts)"))