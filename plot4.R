#plot 4

setwd("C:\\Users\\Amy\\Desktop\\Coursera files\\exploratory_data_analysis")


data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

# convert date text to as.date format (for subsetting)
data["Date"] <- as.Date(data$Date, format = "%d/%m/%Y")

#subset to desired dates
start_date <- as.Date("2007-02-01")
end_date <- as.Date("2007-02-02")


#open PNG plotting device




#plot histogram to png device

# turn off device
dev.off()