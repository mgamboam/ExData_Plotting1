#Load libraries
library(data.table)

generatePlot2 <- function(){
      
      #Load the Data
      subSet <- fread ("./data/hhd.csv", na.strings="?", stringsAsFactors=FALSE, header=TRUE)
      subSet$Global_active_power <- as.numeric(subSet$Global_active_power)
      subSet$Global_reactive_power <- as.numeric(subSet$Global_reactive_power)
      subSet$Time_stamp <- as.POSIXct(subSet$Time_stamp, format="%Y-%m-%d %H:%M:%S")
      
      # Open plotting file
      png(filename = "plot2.png",
          width = 480, height = 480, units = "px", pointsize = 12,
          bg = "white")
      
      #Generate first plot
      with(subSet, plot(Global_active_power, 
            type="l", 
            ylab = "Global Active Power (kilowatts)"))
      dev.off()   # Close plot and save file   
}
