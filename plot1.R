## plot1.R
## Emilie H. Wolf
## May 6, 2017

## Check for dataset, if not found, call readplotdata.R
if(!exists("pow")) {source("readplotdata.R")}

## Open PNG graphic device
png(filename = "plot1.png",width=480,height=480)

## Plot the labeled histogram to the PNG file
with(pow, hist(Global_active_power, col="red", bg="transparent",
               xlab="Global Active Power (kilowatts)",
               main = "Global Active Power"))

## Close and save PNG graphic
dev.off()
