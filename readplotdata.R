## readplotdata.R
## Emilie H. Wolf
## May 6, 2017

if (!require("data.table")) {
        install.packages("data.table")
}
if (!require("lubridate")) {
        install.packages("lubridate")
}

library(data.table)

## Reads in only the rows for Feb 1, 2007 and Feb 2, 2007
pow <- fread("household_power_consumption.txt", 
             na.strings="?", skip = 66637, nrows = 2880)

## Reads in the variable names since they were skipped
names(pow) <- names(fread("household_power_consumption.txt",
                          nrows = 1, header = TRUE))

## Create a new column called datetime that combines Date and Time
pow[,datetime:=paste(Date,Time)]

## Change the datetime column from chr to POSIXct
library(lubridate)
pow$datetime <- dmy_hms(pow$datetime)
