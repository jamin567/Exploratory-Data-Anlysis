plot2 <- function()  {
    
    library(lubridate)
    householdDF <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")
    subsetDF <- householdDF[householdDF$Date=="1/2/2007" | householdDF$Date=="2/2/2007",]
    plot2DF <- data.frame(daytime=dmy(subsetDF$Date) + hms(subsetDF$Time), 
                          Power=as.numeric(as.character(subsetDF$Global_active_power)))
    plot(plot2DF, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    
    dev.copy(png, "plot2.png", width=480, height=480, units="px")
    dev.off()
    
}