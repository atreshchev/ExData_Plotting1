## DS_C4_W1_assign
## Making Plots of Electric power consumption's data set
## UC Irvine Machine Learning Repository of Data: http://archive.ics.uci.edu/ml/

data_path <- "../datasciencecoursera/data/household_power_consumption.txt"

# 1. Reading data rows corresponding to 2007-02-01 - 2007-02-02 period
#    (optimization for extra large file)
library(lubridate)
initdate <- dmy_hms(paste(initial$Date[1], initial$Time[1])) # get Date & Time from first row of data
startdate <- dmy_hm("01/02/2007 00:00")
stopdate <- dmy_hm("02/02/2007 23:59")

startrow <- as.numeric(difftime(startdate, initdate, units = "mins")) # get searched row difference as time difference
stoprow <- as.numeric(difftime(stopdate, initdate, units = "mins"))

data <- read.table(data_path, skip = (startrow + 1), nrows = (stoprow + 1 - startrow),
                   sep = ";", na = "?", header = FALSE, col.names = colnames(initial),
                   colClasses = dataclasses) # read desired rows only

# 2. Drawing & writing Plot2 - GAP per day dynamics
png(filename = "plot2.png", height = 600, width = 750)

Sys.setlocale("LC_TIME", "en_US.UTF-8")
library(lubridate)
fulldate <- dmy_hms(paste(data$Date, data$Time))

plot(fulldate, data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
