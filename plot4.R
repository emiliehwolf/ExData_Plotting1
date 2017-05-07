## plot4.R
## Emilie H. Wolf
## May 6, 2017

## Check for dataset, if not found, call readplotdata.R
if(!exists("pow")) {
        source("readplotdata.R")
}

## Open PNG graphic device
png(filename = "plot4.png",width=480,height=480)

## Setup parameters for 4 plots
par(mfrow=c(2,2))

## 1st plot (same as plot2.png)
with(pow, plot(datetime,Global_active_power, type="n", 
               bg="transparent", xlab='', 
               ylab='Global Active Power'))
with(pow, lines(datetime,Global_active_power))

## 2nd plot in row 1, col 2
with(pow, plot(datetime,Voltage, type="n",bg="transparent"))
lines(pow$datetime,pow$Voltage)

## 3rd plot (same as plot3.R)
with(pow, plot(datetime,Sub_metering_1, type="n", 
               bg="transparent", xlab='', 
               ylab='Energy sub metering'))
lines(pow$datetime,pow$Sub_metering_1)
lines(pow$datetime,pow$Sub_metering_2,col="red")
lines(pow$datetime,pow$Sub_metering_3,col="blue")
legend("topright",legend=names(pow)[7:9],
       col=c("black","red","blue"),
       lwd=2, bty="n")

## Plot in row 2, col 2
with(pow, plot(datetime,Global_reactive_power, type="n",bg="transparent"))
lines(pow$datetime,pow$Global_reactive_power)

## Close and save PNG graphic
dev.off()
