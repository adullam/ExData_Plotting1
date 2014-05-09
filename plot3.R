data<-read.table("household_power_consumption.txt",
                 header = TRUE,
                 sep = ";", na.strings = "?")

data$Date<-as.Date(data$Date, "%d/%m/%Y")
data<-data[as.Date("2007-02-01")<= data$Date & 
             data$Date<=as.Date("2007-02-02"),]

x <- paste(data$Date, data$Time)
data$Time<-strptime(x, "%Y-%m-%d %H:%M:%S")
colnames(data)[2] <- "Date/Time"

png("plot3.png")

plot(data[,7], xaxt = "n", ylab="Energy sub metering", 
     xlab=" ", type="l")
axis(1, at=c(1,1441, 2880), labels=c("Thu", "Fri", "Sat"))
lines(data[,8], col="red")
lines(data[,9], col="blue")
legend('topright', names(data)[7:9] , lty=1, 
       col=c('black', 'red', 'blue'))

dev.off()
