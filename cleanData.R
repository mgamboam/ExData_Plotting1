#Clean Data
library(data.table)

cleanDataset <- function(){
      #Load the Data
      rawData <- fread ("./data/household_power_consumption.txt", na.strings="?", stringsAsFactors=FALSE, header=TRUE)
      
      #Convert the dates into r date objects
      rawData$Date <- as.Date(rawData$Date, "%d/%m/%Y")
      
      #Select only the dates needed for the plots and convert information to numeric
      subSet <- rawData[rawData$Date >= "2007-02-01" & rawData$Date <= "2007-02-02"]
      Time_stamp <- as.POSIXct(paste(subSet$Date, subSet$Time), format="%Y-%m-%d %H:%M:%S")
 
      subSet <- cbind(subSet, Time_stamp)
      write.csv(subSet, "./data/hhd.csv")
      
}