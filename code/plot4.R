getwd()
source("code/read.R")
data_full <- read()

dt <- with(data_full, as.POSIXct(paste(Date, Time)))
data_full$dt <- dt

png("figs/plot4.png", width=480, height=480)

par(mfrow=c(2,2))

# p1
plot(data_full[, dt], data_full[, Global_active_power], type="l", xlab="", ylab="Global Active Power")

# p2
plot(data_full[, dt],data_full[, Voltage], type="l", xlab="dt", ylab="Voltage")

# p3
plot(data_full[, dt], data_full[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(data_full[, dt], data_full[, Sub_metering_2], col="red")
lines(data_full[, dt], data_full[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue"), 
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lwd=c(1,1))
# p4
plot(data_full[, dt], data_full[,Global_reactive_power], type="l", xlab="dt", ylab="Global_reactive_power")

dev.off()
