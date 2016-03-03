#Reading Table
dat<-read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subsetting Data on dates
subdat <- dat[dat$Date %in% c("1/2/2007","2/2/2007") ,]

#read as numeric
globalAP <- as.numeric(subdat$Global_active_power)
subMetering1 <- as.numeric(subdat$Sub_metering_1)
subMetering2 <- as.numeric(subdat$Sub_metering_2)
subMetering3 <- as.numeric(subdat$Sub_metering_3)
globalRP <- as.numeric(subdat$Global_reactive_power)
voltage <- as.numeric(subdat$Voltage)
new_daytime <- strptime(paste(subdat$Date, subdat$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Plot
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(new_daytime, globalAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(new_daytime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(new_daytime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(new_daytime, subMetering2, type="l", col="red")
lines(new_daytime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(new_daytime, globalRP, type="l", xlab="datetime", ylab="Global_reactive_power")


dev.off()
