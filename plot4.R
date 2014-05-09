data<-read.table("household_power_consumption.txt",
                 header = TRUE,
                 sep = ";", na.strings = "?")

data$Date<-as.Date(data$Date, "%d/%m/%Y")
data<-data[as.Date("2007-02-01")<= data$Date & 
             data$Date<=as.Date("2007-02-02"),]

x <- paste(data$Date, data$Time)
data$Time<-strptime(x, "%Y-%m-%d %H:%M:%S")
colnames(data)[2] <- "Date/Time"


png("plot4.png")

par(mfrow=c(2,2))

#1
plot(data[,3], xaxt = "n", ylab="Global Active Power (kilowatts)", 
     xlab=" ", type="l")
axis(1, at=c(1,1441, 2880), labels=c("Thu", "Fri", "Sat"))

#2
plot(data[,5], xaxt = "n", xlab="datetime", type="l", 
     ylab="Voltage")
axis(1, at=c(1,1441, 2880), labels=c("Thu", "Fri", "Sat"))

#3
plot(data[,7], xaxt = "n", ylab="Energy sub metering", 
     xlab=" ", type="l")
axis(1, at=c(1,1441, 2880), labels=c("Thu", "Fri", "Sat"))
lines(data[,8], col="red")
lines(data[,9], col="blue")
legend('topright', names(data)[7:9] , lty=1, bty='n', cex=0.9,
       col=c('black', 'red', 'blue'))

#4
plot(data[,4], xaxt = "n", xlab="datetime", type="l", 
     ylab="Global_reactive_power")
axis(1, at=c(1,1441, 2880), labels=c("Thu", "Fri", "Sat"))

dev.off()
