plot1 <- function(file) {
    
    
    data <- read.table(file,
                    sep=";", header = TRUE, stringsAsFactors=FALSE, 
                    na.strings="?", blank.lines.skip=TRUE
                    )
 
    data <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")
#    print(str(data))

    png(file = "plot1.PNG",width = 480, height = 480) 

    with(data,hist(Global_active_power, main = "Global Active Power", 
                   col="red", xlab="Global Active Power (kilowatts)"))
    dev.off() 
}
