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

# plot 4 - submetering

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
     plot(Global_active_power~Datetime, type="l", 
          ylab="Global Active Power", xlab="")
     plot(Voltage~Datetime, type="l", 
          ylab="Voltage", xlab="")
     plot(Sub_metering_1~Datetime, type="l", 
          ylab="Energy sub metering", xlab="")
     lines(Sub_metering_2~Datetime,col='Red')
     lines(Sub_metering_3~Datetime,col='Blue')
     legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
            legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
     plot(Global_reactive_power~Datetime, type="l", 
          ylab="global_reactive_power",xlab="")
})

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
