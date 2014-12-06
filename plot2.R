df <- "household_power_consumption.txt"
data <- read.table(df, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subset the data from dates 2007-02-01 and 2007-02-02
sdf <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


#Subset the Global_active_power and 
datetime <- strptime(paste(sdf$Date, sdf$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(sdf$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Turn off current device
dev.off()