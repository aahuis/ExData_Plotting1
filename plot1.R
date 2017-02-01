hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
#transform dates in POSIX  format
hpc$Time <- strptime(hpc$Time,format="%H:%M:%S")
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
#create subset with relevant dates only
subset_hpc <- subset(hpc, Date =="2007-02-01" | Date == "2007-02-02")
#remove original data set to free memory
rm("hpc")

#transform factor to numeric values
subset_hpc$Global_active_power <- as.numeric(as.character(subset_hpc$Global_active_power))

#open the device png
png(filename = "plot1.png", width = 480, height = 480)

#draw the plot
hist(subset_hpc$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#close the device
dev.off()
