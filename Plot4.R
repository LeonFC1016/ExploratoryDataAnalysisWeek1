library(lubridate)

# read household power consumption data
df <- read.table("./household_power_consumption.txt", sep=";", na.strings="?", 
                 header=TRUE, skip=66636, nrows=2881)

# assign data frame column names
colnames(df) <- c("Date", "Time", "Global_active_power", 
                  "Global_reactive_power", "Voltage", "Global_intensity",
                  "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# set parameters for graphic device layout
par(mfcol=c(2,2))

# paste the date and time values together
x <- paste(df[,1], df[,2])

# parse the pasted values as date-time classes
df$datetime <- strptime(x, "%d/%m/%Y %H:%M:%S")

# plot the line graph in the top left

with(df, plot(datetime, Global_active_power, type="l", xlab="",
              ylab="Global Active Power (kilowatts)"))

# plot the line graph in the bottom left
with(df, plot(datetime, Sub_metering_1, type="l", xlab="",
              ylab="Energy sub metering"))
with(df,lines(datetime, Sub_metering_2, type="l", col="red"))
with(df, lines(datetime, Sub_metering_3, type="l", col="blue"))

# add legend to line graph
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c(1, 2, 4), lty=1, bty="n", cex=0.75, y.intersp=.9)

# plot line graph in the top right
with(df, plot(datetime, Voltage, type="l", xlab="datetime",
              ylab="Voltage"))

# plot line graph in the bottom right
with(df, plot(datetime, Global_reactive_power, type="l", xlab="datetime",
              ylab="Global_reactive_power"))

# saves plot as Plot4.png
png(filename="Plot4.png", width=480, height=480)