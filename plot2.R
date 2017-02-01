library(lubridate)

hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
#transform dates in POSIX  format
hpc$Time <- strptime(hpc$Time,format="%H:%M:%S")
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
#create subset with relevant dates only
subset_hpc <- subset(hpc, Date =="2007-02-01" | Date == "2007-02-02")
#set the correct date to the time variable
year(subset_hpc$Time) <- year(subset_hpc$Date)
month(subset_hpc$Time) <- month(subset_hpc$Date)
day(subset_hpc$Time) <- day(subset_hpc$Date)
#remove original data set to free memory
rm("hpc")

#transform factor to numeric values
subset_hpc$Global_active_power <- as.numeric(as.character(subset_hpc$Global_active_power))
subset_hpc$Sub_metering_1 <- as.numeric(as.character(subset_hpc$Sub_metering_1))
subset_hpc$Sub_metering_2 <- as.numeric(as.character(subset_hpc$Sub_metering_2))
subset_hpc$Sub_metering_3 <- as.numeric(as.character(subset_hpc$Sub_metering_3))

#open the device png
png(filename = "plot2.png", width = 480, height = 480)

#draw the plot
plot(subset_hpc$Time, subset_hpc$Global_active_power, type="l", xlab="", ylab="Global Active Power")

#close the device
dev.off()
