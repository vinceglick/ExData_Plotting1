df <- "household_power_consumption.txt"
data <- read.table(df, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subset the data from dates 2007-02-01 and 2007-02-02
sdf <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


#Subset the Global_active_power and 
datetime <- strptime(paste(sdf$Date, sdf$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(sdf$Global_active_power)
globalReactivePower <- as.numeric(sdf$Global_reactive_power)
voltage <- as.numeric(sdf$Voltage)
sMeter1 <- as.numeric(sdf$Sub_metering_1)
sMeter2 <- as.numeric(sdf$Sub_metering_2)
sMeter3 <- as.numeric(sdf$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#Plots the Global Active Power data
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#Plots the Voltage data
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

#Plots the Energy Sebmetering data
plot(datetime, sMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sMeter2, type="l", col="red")
lines(datetime, sMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
#Plots the Global Reactive Power data

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_Reactive_Power")

dev.off()