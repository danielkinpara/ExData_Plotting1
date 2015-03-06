######################################################################################
#
# This code plots the line grapihc of Energy Sub-metering. It opens the data file
# "household_power_consumption.txt" and loads the data of February 1st and 2nd, 2007,
# of three variables: "Sub_metering_1", "Sub_metering_2", "Sub_metering_3". The
# output is the graphic of this variable as a PNG file named "plot3.png".
#
# The "plot3.R" must be placed in the same folder where the data file is. The PNG file
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


## It converts the variables $Date and $Time into "x" as a POSIXct class.
## "y1", "y2", and "y3" contains the three sub-metering data, respectively.

x <- as.POSIXct(paste(tabela$Date, tabela$Time), format = "%d/%m/%Y %H:%M:%S")
y1 <- tabela$Sub_metering_1
y2 <- tabela$Sub_metering_2
y3 <- tabela$Sub_metering_3


## It sets the margins and size of the fonts for the labels and axis. The values
## were chosen in order to let the PNG file looks like the figures showed in
## README.md file.

par(mar = c(4,8,4,6), cex.lab = 0.8, cex.axis = 0.8)

## It plots the line graphic. Label of the axis X were assigned blank. Otherwise,
## the letter "X" shows as label. It has to be added blank spaces after the
## variables names in order to adjust the lenged position in the PNG file.

plot(x, y1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(x, y2, col = "red")
lines(x, y3, col = "blue")
legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1     ", "Sub_metering_2     ", "Sub_metering_3     "), 
       cex = 0.8, lty = 1)


## It saves the current device to the file "plot3.png".

dev.copy(png, file = "plot3.png", width = 640, height = 480)
dev.off()
