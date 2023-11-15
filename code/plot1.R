library(data.table)
library(dplyr)
path <- getwd()

filename <- "data.zip"

# Checking if archieve already exists.
if (!file.exists(filename)){
  url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  f <- download.file(url, destfile = filename, method="curl")
  outDir <- file.path(path, "data")
  unzip(zipfile = filename, exdir = outDir)
  rm(f)
}  

file = list.files(file.path(path,"data"))

setwd(file.path(path, "data"))

## load first 10 rows to get familiar with the data, and then read and filter the data by date range
try <- fread(file, na.strings="?",nrows = 10)
head(try)
data_full <- fread(file, na.strings="?")
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")
data_full <- data_full %>% 
  filter(Date>= "2007-02-01" & "2007-02-02">= Date)

head(data_full)

hist(data_full$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")


dev.copy(png, file="../figs/plot1.png", height=480, width=480)
dev.off()