# Set working directory
setwd("/Users/berlyn/Google Drive/Coursera R")

# read data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

# subset for variables of interest
newdata <- subset(data, select = c("Date", "Global_active_power"))

# data dates are 2007-02-01 and 2007-02-02
date_range <- subset(newdata, Date == "1/2/2007")
date_range2 <- subset(newdata, Date == "2/2/2007")

# put together data
clean_data <- rbind(date_range,date_range2)

# make histogram
hist(as.numeric(clean_data$Global_active_power), ylab = "Frequency", xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
