library(lubridate)

# read household power consumption data
df <- read.table("./household_power_consumption.txt", sep=";", na.strings="?", 
           header=TRUE, skip=66636, nrows=2880)

# assign data frame column names
colnames(df) <- c("Date", "Time", "Global_active_power", 
                  "Global_reactive_power", "Voltage", "Global_intensity",
                  "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# parse columns to date class
df[,1] <- dmy(df[,1])
df[,2] <- hms(df[,2])

# coerce columns to numeric class
df[,3:9] <- sapply(sapply(df[,3:9], as.character),as.numeric)

#save the plot as Plot1.png
png(filename="Plot1.png", width=480, height=480)

# set parameters for graphic device layout
par(mfrow=c(1,1))

#plot the histogram
hist(df[,3], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="red")

dev.off()
