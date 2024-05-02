#Let's assume we do not have data on our PC, so we download it. It works similarly to the previous 3 graphs, we are adding a partition.

download.file(url ="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "HPC_data.zip")

#We have to unzip the data to make them readable

unzip("HPC_data.zip")

# Let's store our data in a dataframe called HPC (Household Power Consumption)

HPC <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec=".")

# subset for only the data we want to be plotted

ToBePlotted <- HPC[HPC$Date %in% c("1/2/2007", "2/2/2007") ,]


datetime <- strptime(paste(ToBePlotted$Date, ToBePlotted$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 



GAP <- as.numeric(ToBePlotted$Global_active_power)



GRP <- as.numeric(ToBePlotted$Global_reactive_power)


voltage <- as.numeric(ToBePlotted$Voltage)


subMetering1 <- as.numeric(ToBePlotted$Sub_metering_1)


subMetering2 <- as.numeric(ToBePlotted$Sub_metering_2)


subMetering3 <- as.numeric(ToBePlotted$Sub_metering_3)


png("plot4.png", width=480, height=480)

#adding a partition to the graphic

par(mfrow = c(2, 2)) 

#creating the plots

plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")

# adding the colors

lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, GRP, type="l", xlab="datetime", ylab="Global_reactive_power")

#close the graphic device

dev.off()