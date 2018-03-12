#plot 3
setwd("C:\\Users\\Amy\\Desktop\\Coursera files\\exploratory_data_analysis\\ExData_Plotting1")

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "zipped.zip")
unzip("zipped.zip")

data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE,
                 colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

start_date <- as.Date("2007-02-01")
end_date <- as.Date("2007-02-02")
data <- subset(data, Date >= start_date & Date <= end_date)
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

#open PNG plotting device
png("plot3.png")

with(data, {
    plot(Sub_metering_1 ~ DateTime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2 ~ DateTime, col='Red')
    lines(Sub_metering_3 ~ DateTime, col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# turn off device
dev.off()