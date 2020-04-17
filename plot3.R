# read data 2007-02-01 and 2007-02-02 only
dataset = read.table(file = "/home/mateusz/Desktop/Working_directory_R/household_power_consumption.txt", skip = 66637, nrows = 69517-66638+1, sep = ";")
colnames(dataset) = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

png(file = "plot3.png")
dataset = mutate(dataset, dateNtime = as.POSIXct(paste(dataset$Date, dataset$Time), format="%d/%m/%Y %H:%M:%S"))
with(dataset, plot(dateNtime, Sub_metering_1,ylab = "Energy sub metering",xlab = "", type = "n"))
with(dataset, lines(dateNtime,Sub_metering_1, col = c("black")))
with(dataset, lines(dateNtime,Sub_metering_2, col = c("red")))
with(dataset, lines(dateNtime,Sub_metering_3, col = c("blue")))
legend("topright",lty = 1, col = c("black", "red" , "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))
dev.off()
