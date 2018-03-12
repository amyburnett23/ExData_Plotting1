#PLOT 1

setwd("C:\\Users\\Amy\\Desktop\\Coursera files\\exploratory_data_analysis\\ExData_Plotting1")

# read text file
data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

# convert date text to as.date format (for subsetting)
data["Date"] <- as.Date(data$Date, format = "%d/%m/%Y")

#subset to desired dates
start_date <- as.Date("2007-02-01")
end_date <- as.Date("2007-02-02")

data <- subset(data, Date >= start_date & Date <= end_date)

#open PNG plotting device
png("plot1.png")

#generate histogram
hist(data$Global_active_power, col = "red", main= "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

# turn off device
dev.off()