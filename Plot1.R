
#Let's assume we do not have data on our PC, so we download it

download.file(url ="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "HPC_data.zip")

#We have to unzip the data to make them readable

unzip("HPC_data.zip")

# Let's store our data in a dataframe called HPC (Household Power Consumption)

HPC <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec=".")

# subset for only the data we want to be plotted

ToBePlotted <- HPC[HPC$Date %in% c("1/2/2007", "2/2/2007") ,]

# convert those we want to be plotted in numeric

GAP <- as.numeric(ToBePlotted$Global_active_power)

# activate the graphic device

png("plot1.png", width = 480, height = 480)

# create the histogram

hist(GAP, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# close the graphic device

dev.off()