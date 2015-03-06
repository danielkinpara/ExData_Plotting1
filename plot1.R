######################################################################################
#
# This code plots the histogram of Global Active Power. It opens the data file
# "household_power_consumption.txt" and loads the data of February 1st and 2nd, 2007,
# of the  the variabel "Global_active_power". The output is the histogram of this
# variable as a PNG file named "plot1.png".
#
# The "plot1.R" must be placed in the same folder where the data file is. The PNG file
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


## It sets the margins and size of the fonts for the labels and axis.

par(mar = c(5,8,2,4), cex.lab = 0.9, cex.axis = 0.9)


## It plots the histogram with red bards.

hist(tabela$Global_active_power, xlab = "Global Active Power (kilowatts)",
     main = paste("Global Active Power"), col = "red")


## It saves the current device to the file "plot1.png".

dev.copy(png, file = "plot1.png")
dev.off()
