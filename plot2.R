## plot2.R
## Emilie H. Wolf
## May 6, 2017

## Check for dataset, if not found, call readplotdata.R
if(!exists("pow")) {source("readplotdata.R")}

## Open PNG graphic device
png(filename = "plot2.png",width=480,height=480)

## Plot the line chart to the PNG file
with(pow, plot(datetime,Global_active_power, type="n", 
               bg="transparent", xlab='', 
               ylab='Global Active Power (kilowatts)'))
with(pow, lines(datetime,Global_active_power))

## Close and save PNG graphic
dev.off()
