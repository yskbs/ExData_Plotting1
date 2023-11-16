read <- function(){
  library(data.table)
  library(dplyr)
  
  path <- getwd()
  filename <- "data.zip"
  
  url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url, destfile = filename, method="curl")
  # outDir <- file.path(path, "data")
  unzip(zipfile = filename)
  
  
  ## load first 10 rows to get familiar with the data, and then read and filter the data by date range
  try <- fread("household_power_consumption.txt", na.strings="?",nrows = 10)
  head(try)
  str(try)
  
  data_full <- fread("household_power_consumption.txt", na.strings="?")
  data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")
  data_full<- data_full[Date>= "2007-02-01" & "2007-02-02">= Date]
  
  data_full
}