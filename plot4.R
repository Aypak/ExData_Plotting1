#Reading in the dataset into R 
household_power_consumption <- read.csv("~/R/household_power_consumption.txt", sep=";")

#Extracting data for the first 2 days of February only and mutating the date column into POSTIXlt using lubridate
data<- household_power_consumption %>% mutate(Date=dmy(household_power_consumption$Date))
%>% filter(Date==dmy("01/02/2007")|Date==dmy("02/02/2007"))

#Coercing the global active power from factor to numeric     
data<- data %>% mutate(Global_active_power=as.numeric(levels(data$Global_active_power))[data$Global_active_power])

#Create new column DateTime by combining date and time
data<- data %>% mutate(DateTime=paste(Date, Time, sep=" "))

#Coerce DateTime into POSTIXlt
data<- data %>% mutate(DateTime=ymd_hms(data$DateTime))

#Coercing Sub_metering 1 and 2 from factor to numeric     
data<- data %>% mutate(Sub_metering_1=as.numeric(levels(data$Sub_metering_1))[data$Sub_metering_1])
data<- data %>% mutate(Sub_metering_2=as.numeric(levels(data$Sub_metering_2))[data$Sub_metering_2])

#Coerce Global_reactive_power and Voltage to numeric
data<- data %>% mutate(Global_reactive_power=as.numeric(levels(data$Global_reactive_power))[data$Global_reactive_power])
data<- data %>% mutate(Voltage=as.numeric(levels(data$Voltage))[data$Voltage])

#Divide graphics device into 2 rows and 2 columns
par(mfrow=c(2,2))

#First plot
plot(Global_active_power~DateTime,data=data,xlab="",ylab="Global active power", type="l")

#Second plot
plot(Voltage~DateTime,data=data,xlab="datetime",ylab="Voltage", type="l")

#Third plot
plot(Sub_metering_1~DateTime, data=data,type="l",xlab="",ylab="Energy sub metering")
lines(Sub_metering_2~DateTime, data=data,type="l",col="red")
lines(Sub_metering_3~DateTime, data=data,type="l",col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty=1,bty='n', cex=.3)
#Fourth plot
plot(Global_reactive_power~DateTime,data=data,xlab="datetime",ylab="Global_reactive_power", type="l")
