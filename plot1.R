#R-Script of Plot 1
library(data.table)
data     <- fread("household_power_consumption.txt", sep=";", header=TRUE, select=c("Date","Global_active_power"))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data_sub <- data[(Date=="2007-02-01" | Date=="2007-02-02")]
hist(as.numeric(data_sub$Global_active_power), main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png")#
dev.off()

