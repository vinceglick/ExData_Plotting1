df <- "household_power_consumption.txt"
data <- read.table(df, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subset the data from dates 2007-02-01 and 2007-02-02
sdf <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#plot Global_active_power field histogram from sdf subset
globalActivePower <- as.numeric(sdf$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Turn off current device
dev.off()