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

# plots line graph
with(df, plot(datetime, Sub_metering_1, type="l", xlab="",
              ylab="Energy sub metering"))

# adds lines
with(df,lines(datetime, Sub_metering_2, type="l", col="red"))
with(df, lines(datetime, Sub_metering_3, type="l", col="blue"))

# adds legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c(1, 2, 4), lty=1, cex=0.75, y.intersp=.9)

# save the plot as Plot3.png
png(filename="Plot3.png", width=480, height=480)
dev.off()
