# read data
tab5rows <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",quote = "", nrows = 5)
classes <- sapply(tab5rows, class)

Data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = classes, nrows = 2075259, comment.char = "")

goodRows <- which(Data$Date == "1/2/2007" | Data$Date == "2/2/2007")
goodData <- Data[goodRows, ]

# plot1
library(datasets)
par(mar=c(4,4,2,2))

with(faithful, hist(goodData$Global_active_power,
                    col = "red", 
                    main = "Global Active Power", 
                    xlab="Global Active Power (kilowatts)", cex.lab = 0.75,
                    cey.lab = 0.75, xlim = c(0, 6),
                    ylim = c(0, 1200))) 

# save as png
dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px") 
dev.off() 


