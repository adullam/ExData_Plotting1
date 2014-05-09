data<-read.table("household_power_consumption.txt",
                 header = TRUE,
                 sep = ";", na.strings = "?")

data$Date<-as.Date(data$Date, "%d/%m/%Y")
data<-data[as.Date("2007-02-01")<= data$Date & 
             data$Date<=as.Date("2007-02-02"),]

x <- paste(data$Date, data$Time)
data$Time<-strptime(x, "%Y-%m-%d %H:%M:%S")
colnames(data)[2] <- "Date/Time"

plot(data[,3], xaxt = "n", ylab="Global Active Power (kilowatts)", 
     xlab=" ", type="l")
axis(1, at=c(1,1441, 2880), labels=c("Thu", "Fri", "Sat"))

dev.copy(png,'plot2.png')
dev.off()
