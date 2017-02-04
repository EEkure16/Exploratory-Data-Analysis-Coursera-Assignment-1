hpc_data <- "./household_power_consumption.txt"
data <- read.table(hpc_data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data_subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


dmhs <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gap_data <- as.numeric(data_subset$Global_active_power)
sub_m1 <- as.numeric(data_subset$Sub_metering_1)
sub_m2 <- as.numeric(data_subset$Sub_metering_2)
sub_m3 <- as.numeric(data_subset$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(dmhs, sub_m1, type="l", ylab="Energy Submetering", xlab="")
lines(dmhs, sub_m2, type="l", col="red")
lines(dmhs, sub_m3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()