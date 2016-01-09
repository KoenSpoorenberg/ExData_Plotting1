##getwd()
##setwd("C:/Users/Koen/Documents/GitHub/ExData_Plotting1")


## Preperations (download and unzip/load)

downloadfile<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile<-"dataset.zip"

#Download if not already available
if(!file.exists(zipfile))
{
  download.file(downloadfile, zipfile)
}

# Unzip if necessary
if (!file.exists("household_power_consumption.txt")) { 
  unzip(zipfile) 
}

# load data
data <- read.csv("household_power_consumption.txt",na.strings = "?",header=T,sep=";")


#only interested in 20070201+20070202
relevant_data<-subset(data, Date=="1/2/2007" | Date=="2/2/2007")

# datetime conversions
relevant_data$DateTime <- as.POSIXct(paste(relevant_data$Date, relevant_data$Time, sep=" "), 
                            format="%d/%m/%Y %H:%M:%S")


# plot1
png(filename="plot1.png", width=480, height=480)
hist(relevant_data$Global_active_power, 
     col="#ff2500", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")
dev.off()

#plot2 
png(filename="plot2.png", width=480, height=480)
plot(relevant_data$DateTime, 
     relevant_data$Global_active_power, 
     type="l",
     col="black", 
     xlab="", 
     ylab="Global Active Power (kilowatts)", 
     main="")
dev.off()

#plot3
png(filename="plot3.png", width=480, height=480)
plot(relevant_data$DateTime, 
     relevant_data$Sub_metering_1, 
     type="l",
     col="black", 
     xlab="", 
     ylab="Energy sub metering", 
     main="")
lines(relevant_data$DateTime, relevant_data$Sub_metering_2, col="red")
lines(relevant_data$DateTime, relevant_data$Sub_metering_3, col="blue")
legend("topright", 
       lwd=1, 
       lty=1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

#plot4
png(filename="plot4.png", width=480, height=480)
par(mfcol=c(2,2))
plot(relevant_data$DateTime, 
     relevant_data$Global_active_power, 
     type="l",
     col="black", 
     xlab="", 
     ylab="Global Active Power (kilowatts)", 
     main="")

plot(relevant_data$DateTime, 
     relevant_data$Sub_metering_1, 
     type="l",
     col="black", 
     xlab="", 
     ylab="Energy sub metering", 
     main="")
lines(relevant_data$DateTime, relevant_data$Sub_metering_2, col="red")
lines(relevant_data$DateTime, relevant_data$Sub_metering_3, col="blue")
legend("topright", 
       lwd=1, 
       lty=1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(relevant_data$DateTime, 
     relevant_data$Voltage, 
     type="l",
     col="black", 
     xlab="datetime", 
     ylab="Voltage", 
     main="")

plot(relevant_data$DateTime, 
     relevant_data$Global_reactive_power, 
     type="l",
     col="black", 
     xlab="datetime", 
     ylab="Global_reactive_power", 
     main="")

dev.off()

#Cleanup

file.exists("household_power_consumption.txt")
{
  file.remove("household_power_consumption.txt")
}

file.exists(zipfile)
{
file.remove(zipfile)
}




