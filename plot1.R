#Load libraries
library(data.table)

generatePlot1 <- function(){
      
      #Load the Data
      rawData <- fread ("./data/household_power_consumption.txt", na.strings="?", stringsAsFactors=FALSE, header=TRUE)
      
      #Convert the dates into r date objects
      rawData$Date <- as.Date(rawData$Date, "%d/%m/%Y")
      
      #Select only the dates needed for the plots and convert information to numeric
      subSet <- rawData[rawData$Date >= "2007-02-01" & rawData$Date <= "2007-02-02"]
      subSet$Global_active_power <- as.numeric(subSet$Global_active_power)
      subSet$Global_reactive_power <- as.numeric(subSet$Global_reactive_power)
      
      #Generate first plot
      png(filename = "plot1.png",
          width = 480, height = 480, units = "px", pointsize = 12,
          bg = "white")
      
      with(subSet, hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red"))
      dev.off()      
}
