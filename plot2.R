hpc_data <- "./household_power_consumption.txt"
data <- read.table(hpc_data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data_subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


dmhs <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gap_data <- as.numeric(data_subset$Global_active_power)
png("plot2.png", width=480, height=480)
plot(dmhs, gap_data, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()