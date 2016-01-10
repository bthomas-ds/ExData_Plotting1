# B. Thomas
# Exploratory Data Analysis
# plot2.R

setwd("~/Coursera_Exploratory_Data_Analysis/Week1")
# Clear the environment
rm(list = ls())

# datafile has been subsetting during plot1.R - resuse the subsetted file
dataFile <- "subset_2007.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
dim(subSetData)

# change to Github repository
setwd("./ExData_Plotting1/")

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()