## This code reads data, cleans data, and generates and saves a .png of plots

# Read data
full_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# clean Dates
full_data$Date <- as.Date(full_data$Date, format="%d/%m/%Y")

# subset the data
data <- subset(full_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# remove the full data set
rm(full_data)

# convert the date and time
dates <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(dates)

# plot 1 - hist
hist(data$Global_active_power, ylab = "Frequency", xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
