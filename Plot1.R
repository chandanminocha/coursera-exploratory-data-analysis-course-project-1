#Reading Table
dat<-read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subsetting Data on dates
subdat <- dat[dat$Date %in% c("1/2/2007","2/2/2007") ,]

#read as numeric
globalAP <- as.numeric(subdat$Global_active_power)

#Plot
png("plot1.png", width=480, height=480)
hist(globalAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()