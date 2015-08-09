plot3 <- function()  {
    
    library(lubridate)
    householdDF <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")
    subsetDF <- householdDF[householdDF$Date=="1/2/2007" | householdDF$Date=="2/2/2007",]
    plot3DF <- data.frame(daytime=dmy(subsetDF$Date) + hms(subsetDF$Time), 
                          Submeter1=as.numeric(as.character(subsetDF$Sub_metering_1)), 
                          Submeter2=as.numeric(as.character(subsetDF$Sub_metering_2)), 
                          Submeter3=as.numeric(as.character(subsetDF$Sub_metering_3))) 
    plot(plot3DF$daytime, plot3DF$Submeter1, type="l", xlab="", ylab="Energy sub metering", 
         col="black")
    lines(plot3DF$daytime, plot3DF$Submeter2, type="l", xlab="", ylab="Energy sub metering", 
          col="red")
    lines(plot3DF$daytime, plot3DF$Submeter3, type="l", xlab="", ylab="Energy sub metering", 
          col="blue")
    legend("topright", lty="solid", col=c("black", "red", "blue"), 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    dev.copy(png, "plot3.png", width=480, height=480, units="px")
    dev.off()
    
}