plot3 <- function(file) {
    
    data <- read.table(file,
                    sep=";", header = TRUE, stringsAsFactors=FALSE, 
                    na.strings="?", blank.lines.skip=TRUE
                    )
 
    data <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

    library(lubridate)
    data$fulldate <- dmy_hms(paste(data$Date,data$Time))
    
    png(file = "plot3.PNG",width = 480, height = 480) 

    plot(data$fulldate,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
    points(data$fulldate,data$Sub_metering_2,type="l", col="red")
    points(data$fulldate,data$Sub_metering_3,type="l", col="blue")
    
    legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           lty=c(1,1), # gives the legend appropriate symbols (lines)
           col=c("black","red","blue")) # gives the legend lines the correct color and width
    
    dev.off() 
}
