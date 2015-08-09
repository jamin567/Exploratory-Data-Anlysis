plot1 <- function()  {
    
    householdDF <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")
    subsetDF <- householdDF[householdDF$Date=="1/2/2007" | householdDF$Date=="2/2/2007",]
    hist(as.numeric(as.character(subsetDF$Global_active_power)), col="red", breaks=12, 
         main="Global Active Power", xlab="Global Active Power (kilowatts)")
    
    dev.copy(png, "plot1.png", width=480, height=480, units="px")
    dev.off()
    
}