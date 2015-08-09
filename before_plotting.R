#Reading in the dataset and extracting data for the first 2 days of February only
household_power_consumption<-read.csv(~/R/household_power_consumption.txt, header=TRUE)
#
data<- household_power_consumption %>% mutate(Date=dmy(household_power_consumption$Date))
      %>% filter(Date==dmy("01/02/2007")|Date==dmy("02/02/2007"))
#Coercing the global active power from factor to numeric     
      %>% mutate(Global_active_power=as.numeric(levels(data$Global_active_power))[data$Global_active_power])