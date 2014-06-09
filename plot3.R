#Load libraries
library(data.table)

generatePlot3 <- function(){
      
      #Load the Data
      subSet <- fread ("./data/hhd.csv", na.strings="?", stringsAsFactors=FALSE, header=TRUE)
      subSet$Sub_metering_1 <- as.numeric(subSet$Sub_metering_1)
      subSet$Sub_metering_2 <- as.numeric(subSet$Sub_metering_2)
      subSet$Sub_metering_3 <- as.numeric(subSet$Sub_metering_3)
      subSet$Time_stamp <- as.POSIXct(subSet$Time_stamp, format="%Y-%m-%d %H:%M:%S")
      
      # Open plotting file
      png(filename = "plot3.png",
          width = 480, height = 480, units = "px", pointsize = 12,
          bg = "white")
      
      #Generate first plot
      with(subSet, plot(Time_stamp, Sub_metering_1, 
            type="n", main="", ylab = "Energy sub metering",
            xlab = ""))
      
      with(subSet, points(Time_stamp, Sub_metering_1, type="l", col="black"))
      with(subSet, points(Time_stamp, Sub_metering_2, type="l", col="red"))
      with(subSet, points(Time_stamp, Sub_metering_3, type="l", col="blue"))
      legend("topright", pch = "_",
             col = c("black", "blue", "red"),
             legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      dev.off()   # Close plot and save file   
}


