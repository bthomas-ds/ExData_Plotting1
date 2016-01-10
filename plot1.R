# B. Thomas
# Exploratory Data Analysis - Week 1
# Set working directory to Week 1

setwd("~/Coursera_Exploratory_Data_Analysis/Week1")
# Clear the environment
rm(list = ls())

if (!file.exists("subset_2007.txt")) {
  remoteFile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  localFile <- "household_power_consumption.zip"
  download.file(remoteFile, localFile, method="curl")
  unzip("household_power_consumption.zip", overwrite = TRUE)
  # grep or awk can be used to filter large text files into small subsets
  # the grep command below uses a regular expression to create a smaller subset
  # extra \ is needed in R to escape the escape charater
  system("grep '^2/2/2007\\|^1/2/2007' household_power_consumption.txt > subset_2007.txt", ignore.stderr = FALSE)
  
}

dataFile <- "subset_2007.txt"
# shell_str <- "grep '^2/2/2007\\|^1/2/2007' household_power_consumption.txt > subset_2007.txt"
# system(shell_str)
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
dim(subSetData)

# change to Github repository
setwd("./ExData_Plotting1/")
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()