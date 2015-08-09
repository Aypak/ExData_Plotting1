#Coercing the global active power from factor to numeric     
data<- data %>% mutate(Global_active_power=as.numeric(levels(data$Global_active_power))[data$Global_active_power])
hist(data$Global_active_power,xlab="Global active power (kilowatts)", col="red",main="Global active power")