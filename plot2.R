# read data
tab5rows <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",quote = "", nrows = 5)
classes <- sapply(tab5rows, class)

Data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = classes, nrows = 2075259, comment.char = "")

goodRows <- which(Data$Date == "1/2/2007" | Data$Date == "2/2/2007")
goodData <- Data[goodRows, ]

timeLine <- goodData$TimeLine <- paste(goodData$Date, goodData$Time, sep=" ")
fullDate <- strptime(timeLine, format = "%d/%m/%Y %H:%M:%S")

# plot1
library(datasets)
par(mar=c(4,4,2,2))

with(faithful, plot(fullDate, goodData$Global_active_power, type = "l", 
                     main = "",
                    ylab = "Global Active Power (kilowatts)",
                    xlab = "Cz, Pt, So are Polish abbreviations
                    of Thursday=Thu=Cz, Friday=Fri=Pt, Saturday=Sat=So",
                    cex.lab = 0.75, ylim = c(0, 6) )) 
  
# save as png
dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px") 
dev.off() 
