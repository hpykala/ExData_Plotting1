# function to read the data needed for plots 1-4
library(data.table)

readdata <- function() {
    # Function readdata does the following:
    # 1. download and unzip the data if needed
    # 2. read datafile
    # 3. preprocess data
    # 4. return the data table
    
    filename <- "household_power_consumption.txt"
    zipname <- "household_power_consumption.zip"
    
    # download and unzip the data unless it already exists
    if(!file.exists(filename)) {
        if(!file.exists(zipname )) {
            download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
                          destfile = zipname, mode = "wb")
        }
        unzip(zipname, filename)
    }
    
    # read data
    dt <- fread(filename, colClasses = c(rep("character",2), rep("numeric",7)), na.strings = "?")
    
    #subset the neeeded days
    dt <- dt[Date %in% c("1/2/2007","2/2/2007")]
    
    # preprocess the data table for plotting
    dt[,DateTime := as.POSIXct(strptime(paste(dt$Date,dt$Time),format="%d/%m/%Y %H:%M:%S"))]

    return(dt)
}

