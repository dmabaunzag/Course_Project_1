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
with(subconjunto, hist(Global_active_power,
                  xlab = "Global Active Power (kilowatts)",
                  main = "", col = "red"))
title(main="Global Active Power")
dev.copy(png, file="Plot1.png", width=480, height=480, units="px")
dev.off()
