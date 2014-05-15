# read data
tab5rows <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",quote = "", nrows = 5)
classes <- sapply(tab5rows, class)

Data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = classes, nrows = 2075259, comment.char = "")

goodRows <- which(Data$Date == "1/2/2007" | Data$Date == "2/2/2007")
goodData <- Data[goodRows, ]

timeLine <- goodData$TimeLine <- paste(goodData$Date, goodData$Time, sep=" ")
fullDate <- strptime(timeLine, format = "%d/%m/%Y %H:%M:%S")

library(datasets)

# plot parameter
par(mfrow = c(2, 2), mar = c(4,4,2,2))

###########
# Comment: 
#                Cz, Pt, So are Polish abbreviations
#                of Thursday=Thu=Cz, Friday=Fri=Pt, Saturday=Sat=So,
###########     

with(goodData,{
        # plot1
        plot(fullDate, goodData$Global_active_power, type = "l", 
                            main = "",
                            ylab = "Global Active Power (kilowatts)",
                            xlab = "",
                            cex.lab = 0.5, ylim = c(0, 6), 
             cex.axis = 0.5 )
        
        # plot2
        plot(fullDate, goodData$Voltage, type = "l", 
                            main = "",
                            ylab = "Voltage",
                            xlab = "DateTime",
                            cex.lab = 0.5, ylim = c(234, 246), 
             cex.axis = 0.5 )
        
        # plot3
        plot(fullDate, goodData$Sub_metering_1, type = "l", 
                            main = "",
                            ylab = "Energy sub metering",
                            xlab = "",
                            cex.lab = 0.5, ylim = c(0, 30), 
             cex.axis = 0.5 ) 
         
        lines(fullDate, goodData$Sub_metering_2, col = "red")
        
        
        lines(fullDate, goodData$Sub_metering_3, col = "blue")
        
        legend("topright", lty = 1, col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", 
                          "Sub_metering_3"), 
               cex = 0.5, y.intersp=0.3)
        
        # plot4
        plot(fullDate, goodData$Global_reactive_power, type = "l", 
                            main = "",
                            ylab = "Global_reactive_power",
                            xlab = "DateTime",
                            cex.lab = 0.5, ylim = c(0.0, 0.5), 
             cex.axis = 0.5 )
})

# save as png
dev.copy(png, file = "plot4.png", width = 480, height = 480, units = "px") 
dev.off() 