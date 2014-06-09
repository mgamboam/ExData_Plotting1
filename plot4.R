#Load libraries
library(data.table)

generatePlot4 <- function(){
      
      #Load the Data
      subSet <- fread ("./data/hhd.csv", na.strings="?", stringsAsFactors=FALSE, header=TRUE)
      subSet$Sub_metering_1 <- as.numeric(subSet$Sub_metering_1)
      subSet$Sub_metering_2 <- as.numeric(subSet$Sub_metering_2)
      subSet$Sub_metering_3 <- as.numeric(subSet$Sub_metering_3)
      subSet$Voltage <- as.numeric(subSet$Voltage)
      subSet$Global_active_power <- as.numeric(subSet$Global_active_power)
      
      subSet$Time_stamp <- as.POSIXct(subSet$Time_stamp, format="%Y-%m-%d %H:%M:%S")
      
      # Open plotting file
      png(filename = "plot4.png",
          width = 480, height = 480, units = "px", pointsize = 12,
          bg = "white")
      
      par(mfrow = c(2,2))
      #Generate first plot
      with(subSet, {
           plot(Time_stamp, Global_active_power, 
                type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
           plot(Time_stamp, Voltage, 
                type="l", ylab = "Voltage", xlab = "datetime")
           
           plot(Time_stamp, Sub_metering_1, 
            type="n", main="", ylab = "Energy sub metering",
            xlab = "")
      
            points(Time_stamp, Sub_metering_1, type="l", col="black")
            points(Time_stamp, Sub_metering_2, type="l", col="red")
            points(Time_stamp, Sub_metering_3, type="l", col="blue")
            legend("topright", pch = "_",
                   col = c("black", "blue", "red"),
                   legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
            
            plot(Time_stamp, Global_reactive_power, 
                 type="l", xlab = "datetime")
      })
      dev.off()   # Close plot and save file   
}


