plot4 <- function(file) {
    
    data <- read.table(file,
                    sep=";", header = TRUE, stringsAsFactors=FALSE, 
                    na.strings="?", blank.lines.skip=TRUE
                    )
 
    data <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

    library(lubridate)
    data$fulldate <- dmy_hms(paste(data$Date,data$Time))
    
    png(file = "plot4.PNG",width = 480, height = 480) 

    par(mfcol=c(2,2))
    with(data,{plot(fulldate,Global_active_power,type='l',xlab="",ylab="Global Active Power (kilowatts)")
               
               plot(fulldate,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
               points(fulldate,Sub_metering_2,type="l", col="red")
               points(fulldate,Sub_metering_3,type="l", col="blue")
               legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1), col=c("black","red","blue"))
               
               plot(fulldate,Voltage,type='l',xlab="datetime",ylab="Voltage")
               
               plot(fulldate,Global_reactive_power,type='l',xlab="datetime",ylab="Global_reactive_power")
               })
    
    dev.off() 
}
