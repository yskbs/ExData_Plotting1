getwd()
source("code/read.R")
data_full <- read()

dt <- with(data_full, as.POSIXct(paste(Date, Time)))
data_full$dt <- dt
with(data_full, plot(Global_active_power ~ dt,type="l", ylab="Global Active Power (kilowatts)",xlab=" "))
dev.copy(png, file="figs/plot2.png", height=480, width=480)
dev.off()
