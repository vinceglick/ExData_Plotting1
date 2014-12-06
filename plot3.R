df <- "household_power_consumption.txt"
data <- read.table(df, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subset the data from dates 2007-02-01 and 2007-02-02
sdf <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


#Subset the Global_active_power and 
datetime <- strptime(paste(sdf$Date, sdf$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(sdf$Global_active_power)

#Assign submetering subset data to corresponding variables
sMeter1 <- as.numeric(subSetData$Sub_metering_1)
sMeter2 <- as.numeric(subSetData$Sub_metering_2)
sMeter3 <- as.numeric(subSetData$Sub_metering_3)


#Plot indivdual lines for submetering sets
png("plot3.png", width=480, height=480)
plot(datetime, sMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sMeter2, type="l", col="red")
lines(datetime, sMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#Turn off current device
dev.off()