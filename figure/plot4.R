
#plot4 by Ankur Jain

#Set working directory
wd<-paste(getwd(),"/exploratory_data_analysis/Course Project 1", sep="")
setwd(wd)


#Read data file into memory
temp <- read.table("./data/household_power_consumption.txt", header=TRUE,na.strings = "?",sep = ";",strip.white = TRUE,blank.lines.skip = T,as.is=T)
str(temp)
head(temp)

#Convert into Date and time
temp$Date<- as.Date(temp$Date,format = "%d/%m/%Y")

temp$Time <-paste(temp$Date,temp$Time)
temp$Time<-strptime(temp$Time,format="%Y-%m-%d %H:%M:%S")

head(temp)

# Prepare final data set
household_power<-temp[temp$Date=="2007-02-01" | temp$Date=="2007-02-02",]

png(filename="plot4.png",width = 480, height = 480,bg = "white")
par(mfcol = c(2,2))

#plot(1,1)
with(household_power,plot(Time,Global_active_power, type="l" , ylab="Global Active Power(kilowatts)", xlab=""))

#plot(2,1)
with(household_power,{
        plot(Time,Sub_metering_1, type="l",col="black",xlab="", ylab="Energy sub metering")
        lines(Time,Sub_metering_2, type="l",col="red")
        lines(Time,Sub_metering_3, type="l",col="blue")
})
legend("topright",lwd=1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#plot(1,2)
with(household_power,plot(Time,Voltage, type="l" , xlab="datetime"))

#plot(2,2)
with(household_power,plot(Time,Global_reactive_power, type="l" , xlab="datetime"))

#off graphics device
dev.off()