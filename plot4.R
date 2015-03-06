######################################################################################
#
# This code plots four grapihcs: Global Active Power, Energy Sub-metering, Voltage,
# Global Reactive Power. It opens the data file "household_power_consumption.txt"
# and loads the data of February 1st and 2nd, 2007, of the four mentioned variables.
# The output is the four graphics as a PNG file named "plot4.png".
#
# The "plot4.R" must be placed in the same folder where the data file is. The PNG file
# will be output in the same folder.
#
# (c) Daniel Kinpara, 2015.
# 
######################################################################################


## It reads the data from the dataset file. It skips the rows up to February 1st.
## Then, it loads only the next couple of days of data. It's necessary to name the
## variables again due to the skipping parameter.

tabela <- read.table("household_power_consumption.txt", header = FALSE, sep = ";",
                     na.strings = "?", stringsAsFactors = FALSE, skip = 66637,
                     nrows = 2880, col.names = c("Date", "Time", "Global_active_power",
                                                 "Global_reactive_power", "Voltage",
                                                 "Global_intensity", "Sub_metering_1",
                                                 "Sub_metering_2", "Sub_metering_3"))


## It sets the window parameters to show the four graphics.

par(mfcol = c(2, 2), cex.lab = 0.9, cex.axis = 0.9, mar = c(5, 4, 3, 3))


## It converts the variables $Date and $Time into "x" as a POSIXct class.
## "y" has the Global Active Power data.

x <- as.POSIXct(paste(tabela$Date, tabela$Time), format = "%d/%m/%Y %H:%M:%S")



## It plots the first graphic, an histogram of the Global Active Power.

y <- tabela$Global_active_power

plot(x, y, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")



## It plots the second graphic, a line graphic of the sub-metering variables.

y1 <- tabela$Sub_metering_1
y2 <- tabela$Sub_metering_2
y3 <- tabela$Sub_metering_3

plot(x, y1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(x, y2, col = "red")
lines(x, y3, col = "blue")

legend("top", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       cex = 0.8, lty = 1, bty = "n")



## It plots the third graphic, a line graphic of the Voltage.

y <- tabela$Voltage

plot(x, y, type = "l", ylab = "Voltage", xlab = "datetime")



## It plots the fourth graphic, a line graphic of the Voltage.

y <- tabela$Global_reactive_power

plot(x, y, type = "l", ylab = "Global Reactive Power", xlab = "datetime")



## It saves the current device to the file "plot4.png".

dev.copy(png, file = "plot4.png")
dev.off()
