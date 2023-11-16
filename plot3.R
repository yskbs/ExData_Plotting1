getwd()
source("read.R")
data_full <- read()

dt <- with(data_full, as.POSIXct(paste(Date, Time)))
data_full$dt <- dt

png(file = "plot3.png", width = 480, height = 480)
plot(data_full[, dt], data_full[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(data_full[, dt], data_full[, Sub_metering_2],col="red")
lines(data_full[, dt], data_full[, Sub_metering_3],col="blue")
legend("topright",col=c("black","red","blue"),
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lwd=c(1,1)
)
dev.off()
