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


## Create the plot3 and export it
with(dfSmall,plot(FullDate,Sub_metering_1,pch=26,xlab="",ylab="Energy sub metering"))
lines(dfSmall$FullDate,dfSmall$Sub_metering_1,lwd=1)
lines(dfSmall$FullDate,dfSmall$Sub_metering_2,lwd=1,col="red")
lines(dfSmall$FullDate,dfSmall$Sub_metering_3,lwd=1,col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_2"), lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"),cex = 0.4,pt.cex=1,y.intersp=0.25) 
dev.copy(png, "plot3.png",width=480,height=480,units="px")
dev.off()

