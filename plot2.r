#plot 2

setwd("C:\\Users\\Amy\\Desktop\\Coursera files\\exploratory_data_analysis\\ExData_Plotting1")

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "zipped.zip")
unzip("zipped.zip")
data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE,
                 colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

data <- data[complete.cases(data),]
start_date <- as.Date("2007-02-01")
end_date <- as.Date("2007-02-02")
data <- subset(data, Date >= start_date & Date <= end_date)
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

#open PNG plotting device
png("plot2.png")

plot(data$Global_active_power ~ data$DateTime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

copy(png,"plot2.png", width=480, height=480)
dev.off()