#reading data 2007-02-01 and 2007-02-02
dataset = read.table(file = "/home/mateusz/Desktop/Working_directory_R/household_power_consumption.txt", skip = 66637, nrows = 69517-66638+1, sep = ";")
colnames(dataset) = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# 1 plot
png(file = "plot1.png")
with(dataset, hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",  main = "Global Active Power"))
dev.off()
