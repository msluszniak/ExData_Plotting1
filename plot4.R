# read data 2007-02-01 and 2007-02-02 only
dataset = read.table(file = "household_power_consumption.txt", skip = 66637, nrows = 69517-66638+1, sep = ";")
#set columns names
colnames(dataset) = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

#plot 4
#open Graphic device
png(file = "plot4.png")
#dplyr package 
#add column with date format: dd/mm/YY HH:MM:SS
dataset = mutate(dataset, dateNtime = as.POSIXct(paste(dataset$Date, dataset$Time), format="%d/%m/%Y %H:%M:%S"))
#prepare Graphic device for 4 diffrent plots
par(mfcol = c(2,2))
with(dataset, plot(dateNtime, Global_active_power, ylab = "Global Active Power",xlab = "", type = "n"))
with(dataset, lines(dateNtime, Global_active_power))

with(dataset, plot(dateNtime, Sub_metering_1,ylab = "Energy sub metering",xlab = "", type = "n"))
with(dataset, lines(dateNtime,Sub_metering_1, col = c("black")))
with(dataset, lines(dateNtime,Sub_metering_2, col = c("red")))
with(dataset, lines(dateNtime,Sub_metering_3, col = c("blue")))
#add legend in topright corner with proper parameters
legend("topright",lty = 1, col = c("black", "red" , "blue"), box.lwd = 0, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))

with(dataset, plot(dateNtime, Voltage, ylab = "Voltage",xlab = "datetime", type = "n"))
with(dataset, lines(dateNtime, Voltage))

with(dataset, plot(dateNtime, Global_reactive_power, ylab = "Global_reactive_power",xlab = "datetime", type = "n"))
with(dataset, lines(dateNtime, Global_reactive_power))
#close Graphic device
dev.off()
