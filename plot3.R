setwd("~/Dropbox/Courses/Coursera - Exploratory data analysis/ExData_Plotting1/")
Sys.setlocale("LC_MESSAGES", 'en_GB.UTF-8')

df <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

df$DateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, format="%d/%m/%Y")

t <- subset(df, Date == "2007-02-01" | Date == "2007-02-02")

png("plot3.png", width = 480, height = 480, bg = "transparent")
plot(t$DateTime,
     t$Sub_metering_1,
     type = "l", 
     xlab = "",
     ylab = "Energy sub metering")
lines(t$DateTime, t$Sub_metering_2, col="red")
lines(t$DateTime, t$Sub_metering_3, col="blue")
legend("topright",
       cex = 0.8,
       lty = c(1,1),
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
