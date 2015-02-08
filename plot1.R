#setwd("C:\\ENTER\\zzz\\R2015\\ExploratoryDataAnalysis\\project1")

## Read the data
df <- read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings = c("?"))
df$FullDate<-paste(df$Date,df$Time)
df$FullDate<-strptime(df$FullDate,"%d/%m/%Y %H:%M:%S")

## Subset to the required dates
df$Date<-as.Date(df$Date,"%d/%m/%Y")
vStartDate <- as.Date("2007-02-01")
vEndDate <- as.Date("2007-02-02")
dfSmall <- df[df$Date >= vStartDate & df$Date <= vEndDate,]
rm(df)

## Clean the column types
dfSmall$Global_intensity <- as.numeric(dfSmall$Global_intensity)
dfSmall$Global_active_power <- as.numeric(dfSmall$Global_active_power)
dfSmall$Global_reactive_power <- as.numeric(dfSmall$Global_reactive_power)

## Create the plot1 and export it
with(dfSmall,hist(Global_active_power,col = 'red', xlab="Global Active Power (kilowatts)", main="Global Active Power"))
dev.copy(png, "plot1.png",width=480,height=480,units="px")
dev.off()

