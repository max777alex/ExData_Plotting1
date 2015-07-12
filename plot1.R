setwd("~/Dropbox/Courses/Coursera - Exploratory data analysis/ExData_Plotting1/")

df <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

df$DateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, format="%d/%m/%Y")

t <- subset(df, Date == "2007-02-01" | Date == "2007-02-02")

png("plot1.png", width = 480, height = 480, bg = "transparent")
hist(t$Global_active_power,
     xlab="Global Active Power (kilowatts)", 
     col="red",
     main="Global Active Power")
dev.off()
