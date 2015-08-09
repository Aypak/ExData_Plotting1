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

#Plot line graph of DateTime against Global_active_power
plot(Global_active_power~DateTime, data=data,type="l",xlab="",ylab="Global active power (kilowatts)")