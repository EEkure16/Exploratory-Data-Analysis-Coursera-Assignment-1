hpc_data <- "./household_power_consumption.txt"
data <- read.table(hpc_data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data_subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


dmhs <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gap_data <- as.numeric(data_subset$Global_active_power)
gap_data <- as.numeric(data_subset$Global_reactive_power)
volt <- as.numeric(data_subset$Voltage)
sub_m1 <- as.numeric(data_subset$Sub_metering_1)
sub_m2 <- as.numeric(data_subset$Sub_metering_2)
sub_m3 <- as.numeric(data_subset$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(dmhs, gap_data, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(dmhs, volt, type="l", xlab="datetime", ylab="Voltage")

plot(dmhs, sub_m1, type="l", ylab="Energy Submetering", xlab="")
lines(dmhs, sub_m2, type="l", col="red")
lines(dmhs, sub_m3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(dmhs, gap_data, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()