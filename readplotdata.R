## readplotdata.R
## Emilie H. Wolf
## May 6, 2017

## Check for required packages and install if necessary
if (!require("data.table")) {
        install.packages("data.table")
}
if (!require("lubridate")) {
        install.packages("lubridate")
}

library(data.table)
library(lubridate)

## Reads in only the rows for Feb 1, 2007 and Feb 2, 2007
pow <- fread("household_power_consumption.txt", 
             na.strings="?", skip = 66637, nrows = 2880)

## NOTE: I had to tinker with the huge dataset to find the
## indices for the correct rows. If you know of a better way to
## programatically read in a subset of rows by a condition (rather than skip),
## please let me know. Thank you.

## Reads in the variable names since they were skipped
names(pow) <- names(fread("household_power_consumption.txt",
                          nrows = 1, header = TRUE))

## Create a new column called datetime that combines Date and Time
pow[,datetime:=paste(Date,Time)]

## Change the datetime column from chr to POSIXct
pow$datetime <- dmy_hms(pow$datetime)
