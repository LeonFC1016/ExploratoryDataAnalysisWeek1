library(lubridate)
# read household power consumption data
df <- read.table("./household_power_consumption.txt", sep=";", na.strings="?", 
                 header=TRUE, skip=66636, nrows=2881)

# assign data frame column names
colnames(df) <- c("Date", "Time", "Global_active_power", 
                  "Global_reactive_power", "Voltage", "Global_intensity",
                  "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# set parameters for graphic device layout
par(mfrow=c(1,1))

# paste the date and time values together
x <- paste(df[,1], df[,2])

# parse the pasted values as date-time classes
df$datetime <- strptime(x, "%d/%m/%Y %H:%M:%S")

# plot the line graph
with(df, plot(datetime, Global_active_power, type="l", xlab="",
              ylab="Global Active Power (kilowatts)"))

# save th plot as Plot2.png
png(filename="Plot2.png", width=480, height=480)
dev.off()
