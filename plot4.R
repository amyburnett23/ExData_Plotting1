#plot 4
setwd("C:\\Users\\Amy\\Desktop\\Coursera files\\exploratory_data_analysis\\ExData_Plotting1")

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "zipped.zip")
unzip("zipped.zip")
data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE, colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

# convert date text to as.date format (for subsetting)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#subset to desired dates
start_date <- as.Date("2007-02-01")
end_date <- as.Date("2007-02-02")

data <- subset(data, Date >= start_date & Date <= end_date)

#open PNG plotting device
png("plot4.png")

par(mfrow = c(2,2),
    mar = c(4,4,2,1),
    oma = c(0,0,2,0))
with(data, {
    plot(Global_active_power ~ DateTime, type = "l",
         ylab = "Global Active Power (kilowatts)", xlab = "")
    plot(Voltage ~ DateTime, type = "l",
         ylab = "Voltage (volt)", xlab = "")
    plot(Sub_metering_1 ~ DateTime, type = "l",
         ylab = "Global Active Power (kilowatts)", xlab = "")
    lines(Sub_metering_2 ~ DateTime, col = 'Red')
    lines(Sub_metering_3 ~ DateTime, col = 'Blue')
    legend("topright",
           col = c("black", "red", "blue"),
           lty = 1, lwd = 2, bty = "n",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~DateTime, type = "l",
         ylab = "Global Rective Power (kilowatts)",xlab = "")
})

# turn off device
dev.off()