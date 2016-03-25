setwd("C:\\Users\\Lohit\\OneDrive\\Documents\\Data Sciences\\Cousera\\ExData_Plotting1")
gc()

master_data_set <- read.table("C:\\Users\\Lohit\\Downloads\\household_power_consumption.txt", stringsAsFactors = FALSE, na.strings = "?", 
                              header = TRUE, sep = ";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

master_data_set$datetime <- strptime(paste(master_data_set$Date,master_data_set$Time), format = "%d/%m/%Y %H:%M:%S")
master_data_set$Date <- NULL
master_data_set$Time <- NULL

sample_data_set <- subset(master_data_set, datetime >= " 2007-02-01 00:00:00" & datetime <= " 2007-02-02 23:59:59")
rm(master_data_set)
gc()

#Plot 4 #
png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

plot(sample_data_set$datetime, sample_data_set$Global_active_power, type = "n", ylab = "Global Active Power", xlab = "")
lines(sample_data_set$datetime, sample_data_set$Global_active_power, type = "l")

plot(sample_data_set$datetime, sample_data_set$Voltage, type = "n", ylab = "Voltage", xlab = "datetime")
lines(sample_data_set$datetime, sample_data_set$Voltage, type = "l")

plot(sample_data_set$datetime, sample_data_set$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(sample_data_set$datetime, sample_data_set$Sub_metering_1, col = "black")
lines(sample_data_set$datetime, sample_data_set$Sub_metering_2, col = "red")
lines(sample_data_set$datetime, sample_data_set$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1)

plot(sample_data_set$datetime, sample_data_set$Global_reactive_power, type = "n", ylab = "Global_reactive_power", xlab = "datetime")
lines(sample_data_set$datetime, sample_data_set$Global_reactive_power, type = "l")

dev.off()