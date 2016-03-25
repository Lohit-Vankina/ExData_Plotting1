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

# Plot 2 # 
png(filename = "plot2.png", width = 480, height = 480)

plot(sample_data_set$datetime, sample_data_set$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(sample_data_set$datetime, sample_data_set$Global_active_power, type = "l")

dev.off()

