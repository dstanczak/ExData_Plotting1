plot2 <- function(file) {
    
    
    data <- read.table(file,
                    sep=";", header = TRUE, stringsAsFactors=FALSE, 
                    na.strings="?", blank.lines.skip=TRUE
                    )
 
    data <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")


    library(lubridate)
    data$fulldate <- dmy_hms(paste(data$Date,data$Time))

    png(file = "plot2.PNG",width = 480, height = 480) 

    with(data,plot(fulldate,Global_active_power,type='l',xlab="",
                   ylab="Global Active Power (kilowatts)"))

    dev.off() 
}
