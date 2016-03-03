#Reading Table
dat<-read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subsetting Data on dates
subdat <- dat[dat$Date %in% c("1/2/2007","2/2/2007") ,]

#read as numeric
globalAP <- as.numeric(subdat$Global_active_power)
new_daytime <- strptime(paste(subdat$Date, subdat$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


#Plot
png("plot2.png", width=480, height=480)
plot(new_daytime, globalAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()