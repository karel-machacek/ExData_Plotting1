#plot1.png
#480x480

setwd("C:\\private\\private_karel\\karel\\Coursera\\exploratory_data_analysis\\github\\ExData_Plotting1")
getwd()
fileURL="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(fileURL,"file.zip")
#unzip("file.zip")
list.files(".")


# get file period data for 1st and 2nd Feb 2007
fileContent<-read.table("household_power_consumption.txt", header=TRUE, as.is=TRUE, sep=";")
subFileContent<-subset(fileContent, Date == "1/2/2007" | Date == "2/2/2007")
#fileContent$Date = as.Date(strptime(fileContent$Date, "%d/%m/%Y"))
subFileContent$Date = strptime(paste(subFileContent$Date, subFileContent$Time, sep=" "), 
                                       "%d/%m/%Y %H:%M:%S")

#graph1
library(graphics)
png(filename = "plot2.png", width = 480, height = 480,
    units = "px", pointsize = 12, bg = "white", res = NA, restoreConsole = TRUE)

plot(subFileContent$Date, as.numeric(subFileContent$Global_active_power), type="l", 
     ylab = "Global Active Power (in kilowatts)", xlab = "")
dev.off()