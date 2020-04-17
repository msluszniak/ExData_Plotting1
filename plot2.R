#read data 2007-02-01 and 2007-02-02 only
dataset = read.table(file = "household_power_consumption.txt", skip = 66637, nrows = 69517-66638+1, sep = ";")
colnames(dataset) = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

png(file = "plot2.png")
# dplyr package 
dataset = mutate(dataset, dateNtime = as.POSIXct(paste(dataset$Date, dataset$Time), format="%d/%m/%Y %H:%M:%S"))
with(dataset, plot(dateNtime, Global_active_power, ylab = "Global Active Power (kilowatts)",xlab = "", type = "n"))
with(dataset, lines(dateNtime, Global_active_power))
dev.off()
