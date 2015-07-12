setwd("~/Dropbox/Courses/Coursera - Exploratory data analysis/ExData_Plotting1/")
Sys.setlocale("LC_MESSAGES", 'en_GB.UTF-8')

df <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

df$DateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, format="%d/%m/%Y")

t <- subset(df, Date == "2007-02-01" | Date == "2007-02-02")

png("plot4.png", width = 480, height = 480, bg = "transparent")
par(mfrow = c(2,2))
with(t, {
  plot(DateTime,
       Global_active_power,
       type = "l", 
       xlab = "",
       ylab = "Global Active Power")
  
  plot(DateTime,
       Voltage,
       type = "l", 
       xlab = "datetime",
       ylab="Voltage")
  
  plot(DateTime,
       Sub_metering_1,
       type = "l", 
       xlab = "",
       ylab = "Energy sub metering")
  
  lines(DateTime,
        Sub_metering_2,
        col = "red")
  
  lines(DateTime,
        Sub_metering_3,
        col = "blue")
  
  legend("topright",
         cex = 0.7,
         bty = "n",
         lty = c(1,1),
         col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(DateTime,
       Global_reactive_power,
       type = "l", 
       xlab = "datetime",
       ylab="Global_reactive_Power")
})
dev.off()
