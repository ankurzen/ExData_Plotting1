
#plot2 by Ankur Jain

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

#Plotting and Export
png(filename="plot2.png",width = 480, height = 480,bg = "white")
with(household_power,plot(Time,Global_active_power, type="l" , ylab="Global Active Power(kilowatts)", xlab=""))
dev.off()

