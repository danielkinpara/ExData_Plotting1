######################################################################################
#
# This code plots the line grapihc of Global Active Power. It opens the data file
# "household_power_consumption.txt" and loads the data of February 1st and 2nd, 2007,
# of the  the variable "Global_active_power". The output is the graphic of this
# variable as a PNG file named "plot2.png".
#
# The "plot2.R" must be placed in the same folder where the data file is. The PNG file
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
## "y" contains the $Global_active_power data.

x <- as.POSIXct(paste(tabela$Date, tabela$Time), format = "%d/%m/%Y %H:%M:%S")
y <- tabela$Global_active_power


## It sets the margins and size of the fonts for the labels and axis. The values
## were chosen in order to let the PNG file looks like the figures showed in
## README.md file.

par(mar = c(4,6,4,2), cex.lab = 0.9, cex.axis = 0.9)


## It plots the line graphic. Label of the axis X were assigned blank. Otherwise,
## the letter "X" shows as label.

plot(x, y, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")


## It saves the current device to the file "plot1.png".

dev.copy(png, file = "plot2.png")
dev.off()
