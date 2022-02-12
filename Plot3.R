#loading dataset
household_power_consumption <- read.csv(
    "~/R/Exploratory_Data_Analysis/Course_Project_1/household_power_consumption.txt",
    sep=";", na.strings="?")
# converting the Date and Time variables
household_power_consumption$Date_Time<-
    paste(household_power_consumption$Date, household_power_consumption$Time)

household_power_consumption$Date_Time<-
    strptime(household_power_consumption$Date_Time, "%d/%m/%Y %H:%M:%S" )

household_power_consumption$Date<-
    strptime(household_power_consumption$Date, 
             "%d/%m/%Y")

#subseting the data
subconjunto<-
    subset(household_power_consumption, household_power_consumption$Date>="2007-02-01"& household_power_consumption$Date<="2007-02-02")

#ploting
plot(subconjunto$Date_Time, subconjunto$Sub_metering_1, 
     type = "n",
     xlab = "", 
     ylab = "Energy sub metering")

legend("topright",lty=1,  col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


lines(subconjunto$Date_Time, subconjunto$Sub_metering_1, 
     type = "l")

lines(subconjunto$Date_Time, subconjunto$Sub_metering_2, 
     type = "l",
     col="red")
lines(subconjunto$Date_Time, subconjunto$Sub_metering_3, 
      type = "l",
      col="blue")


dev.copy(png, file="Plot3.png", width=480, height=480, units="px")
dev.off()
