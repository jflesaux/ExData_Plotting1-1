# Read and load household_power_consumption.txt file
power <- read.csv("./household_power_consumption.txt", sep = ";", header = TRUE)
#Convert the Date field from factor to Date
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
#Select only 2 days of data
power_feb <- subset(power, power$Date == as.Date("2007-02-01") | power$Date == as.Date("2007-02-02"))
#Convert field from factor to double precision
power_feb$Global_active_power <- as.numeric(as.character(power_feb$Global_active_power))
#Concatenate Date and Time
power_feb$datetime <- paste(power_feb$Date, as.character(power_feb$Time))
#Draw the Plot
plot(strptime(power_feb$datetime, "%Y-%m-%d %H:%M:%S"), power_feb$Sub_metering_1, type = "l",xlab = "" ,ylab = paste("Energy sub metering"))
lines(strptime(power_feb$datetime, "%Y-%m-%d %H:%M:%S"), power_feb$Sub_metering_2, type = "l", col= "red")
lines(strptime(power_feb$datetime, "%Y-%m-%d %H:%M:%S"), power_feb$Sub_metering_3, type = "l", col= "blue")
legend("topright", pch = 1, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "sub_metering_3"))