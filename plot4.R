plot4 <- function()  {
    
    library(lubridate)
    householdDF <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")
    subsetDF <- householdDF[householdDF$Date=="1/2/2007" | householdDF$Date=="2/2/2007",]
    plot4DF <- data.frame(daytime=dmy(subsetDF$Date) + hms(subsetDF$Time), 
                          Power=as.numeric(as.character(subsetDF$Global_active_power)), 
                          Voltage=as.numeric(as.character(subsetDF$Voltage)), 
                          Submeter1=as.numeric(as.character(subsetDF$Sub_metering_1)), 
                          Submeter2=as.numeric(as.character(subsetDF$Sub_metering_2)), 
                          Submeter3=as.numeric(as.character(subsetDF$Sub_metering_3)), 
                          Global_reactive_power=as.numeric(
                            as.character(subsetDF$Global_reactive_power)))
    attach(plot4DF)
    par(mfrow=c(2,2))
    plot(daytime, Power, type="l", xlab="", ylab="Global Active Power (kilowatts)", 
         cex.lab=0.50, cex.axis=0.50)
    plot(daytime, Voltage, type="l", cex.lab=0.50, cex.axis=0.50)
    plot(daytime, Submeter1, type="l", xlab="", ylab="Energy sub metering", col="black", 
         cex.lab=0.50, cex.axis=0.50)
    lines(daytime, Submeter2, type="l", xlab="", ylab="Energy sub metering", col="red", 
          cex.lab=0.50, cex.axis=0.50)
    lines(daytime, Submeter3, type="l", xlab="", ylab="Energy sub metering", col="blue", 
          cex.lab=0.50, cex.axis=0.50)
    legend("topright", lty="solid", col=c("black", "red", "blue"), 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           cex=0.30)
    plot(daytime, Global_reactive_power, type="l", cex.lab=0.5, cex.axis=0.50)
    
    dev.copy(png, "plot4.png", width=480, height=480, units="px")
    dev.off()
    
}