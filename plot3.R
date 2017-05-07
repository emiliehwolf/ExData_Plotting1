## plot3.R
## Emilie H. Wolf
## May 6, 2017

## Check for dataset, if not found, call readplotdata.R
if(!exists("pow")) {
        source("readplotdata.R")
}

## Open PNG graphic device
png(filename = "plot3.png",width=480,height=480)

## Plot the line chart to the PNG file
with(pow, plot(datetime,Sub_metering_1, type="n", 
               bg="transparent", xlab='', 
               ylab='Energy sub metering'))
lines(pow$datetime,pow$Sub_metering_1)
lines(pow$datetime,pow$Sub_metering_2,col="red")
lines(pow$datetime,pow$Sub_metering_3,col="blue")
legend("topright",legend=names(pow)[7:9],
       col=c("black","red","blue"),
       lwd=2)

## Close and save PNG graphic
dev.off()
