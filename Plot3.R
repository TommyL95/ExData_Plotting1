#Let's assume we do not have data on our PC, so we download it

download.file(url ="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "HPC_data.zip")

#We have to unzip the data to make them readable

unzip("HPC_data.zip")

# Let's store our data in a dataframe called HPC (Household Power Consumption)

HPC <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec=".")

# subset for only the data we want to be plotted

ToBePlotted <- HPC[HPC$Date %in% c("1/2/2007", "2/2/2007") ,]

#Converting data and times in the correct format

datetime <- strptime(paste(ToBePlotted$Date, ToBePlotted$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Converting the submerges in the proper format

subMetering1 <- as.numeric(ToBePlotted$Sub_metering_1)
subMetering2 <- as.numeric(ToBePlotted$Sub_metering_2)
subMetering3 <- as.numeric(ToBePlotted$Sub_metering_3)

# opening the graphic device

png("plot3.png", width=480, height=480)

# creating the plot

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")

# adding color

lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# closing the graphic device

dev.off()