#R-Script of Plot 2
library(data.table)
data     <- fread("household_power_consumption.txt", sep=";", header=TRUE, select=c("Date", "Time","Global_active_power"))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data_sub <- data[(Date=="2007-02-01" | Date=="2007-02-02")]
time <- paste(data_sub$Date, data_sub$Time)
time <- strptime(time, "%Y-%m-%d %H:%M:%S")
plot(time,as.numeric(data_sub$Global_active_power), type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png")
dev.off()
