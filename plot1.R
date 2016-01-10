#plot1.png
#480x480

setwd("C:\\private\\private_karel\\karel\\Coursera\\exploratory_data_analysis\\github\\ExData_Plotting1")
getwd()
fileURL="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,"file.zip")
unzip("file.zip")
list.files(".")

# estimate mem consuption by R object by using first 100 rows roughly 236MB
fileContent<-read.table("household_power_consumption.txt", header=TRUE, as.is=TRUE, sep=";", nrows=100)
fileContent$Date = as.Date(strptime(fileContent$Date, "%d/%m/%Y"))
format(2075259/100 * object.size(fileContent), units = "MB")

# get file period data for 1st and 2nd Feb 2007
fileContent<-read.table("household_power_consumption.txt", header=TRUE, as.is=TRUE, sep=";")
subFileContent<-subset(fileContent, Date == "1/2/2007" | Date == "2/2/2007")
#fileContent$Date = as.Date(strptime(fileContent$Date, "%d/%m/%Y"))
subFileContent$Date = as.Date(strptime(subFileContent$Date, "%d/%m/%Y"))

#graph1
library(graphics)
png(filename = "plot1.png", width = 480, height = 480,
    units = "px", pointsize = 12, bg = "white", res = NA)
hist(as.numeric(subFileContent$Global_active_power), main = "Global Active Power", 
     xlab = "Global Active Power (in kilowatt)", pch = 21, col="red")
dev.off()
