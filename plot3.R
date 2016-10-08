## DS_C4_W1_assign
## Making Plots of Electric power consumption's data set
## UC Irvine Machine Learning Repository of Data: http://archive.ics.uci.edu/ml/

## Plot 3
data_path <- "../datasciencecoursera/data/household_power_consumption.txt"

# 1. Initial data analysis
initial <- read.table(data_path, nrows = 6, sep = ";", header = TRUE)
head(initial)
dataclasses <- sapply(initial, class)

# 2. Reading data rows corresponding to 2007-02-01 - 2007-02-02 period
library(lubridate)
initdate <- dmy_hms(paste(initial$Date[1], initial$Time[1])) # get Date & Time from first row of data
startdate <- dmy_hm("01/02/2007 00:00")
stopdate <- dmy_hm("02/02/2007 23:59")

startrow <- as.numeric(difftime(startdate, initdate, units = "mins")) # get searched row difference as time difference
stoprow <- as.numeric(difftime(stopdate, initdate, units = "mins"))

data <- read.table(data_path, skip = (startrow + 1), nrows = (stoprow + 1 - startrow),
                   sep = ";", header = FALSE, col.names = colnames(initial), colClasses = dataclasses) # read desired rows only
head(data)
tail(data)

# 3. Drawing & writing Plot3 - Sub metering 1/2/3 per day dynamics
png(filename = "plot3.png", height = 600, width = 750)

Sys.setlocale("LC_TIME", "en_US.UTF-8")
library(lubridate)
fulldate <- dmy_hms(paste(data$Date, data$Time))

with(data, {
  plot(fulldate, Sub_metering_1, type = "l", col = "black",
       xlab = "", ylab = "Energy sub metering")
  points(fulldate, Sub_metering_2, type = "l", col = "red")
  points(fulldate, Sub_metering_3, type = "l", col = "blue")
})
legend("topright", col = c("black", "red", "blue"), lwd = 1,
       legend = colnames(data)[7:9])
dev.off()
