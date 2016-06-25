# Reading 1 line of data and getting the Column Names
dat <- read.table("household_power_consumption.txt", nrows = 2, 
                  header = TRUE, sep = ";", na.strings = "?")
columnNames <- names(dat)

# Reading the data set (just from dates 2007-02-01 to 2007-02-02)
dat <- read.table("household_power_consumption.txt", nrows = 2880, 
                  header = FALSE, sep = ";", na.strings = "?", skip = 66637, 
                  col.names = columnNames)

dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

# Creating a DateTime variable of class Date
dat$DateTime <- strptime(paste(dat$Date, dat$Time), "%Y-%m-%d %H:%M:%S")

png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(dat$DateTime, dat$Sub_metering_1, type = "n", ylab = "Energy sub metering",
     xlab = "")
points(dat$DateTime, dat$Sub_metering_1, type = "l", col = "black")
points(dat$DateTime, dat$Sub_metering_2, type = "l", col = "red")
points(dat$DateTime, dat$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()