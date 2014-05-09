data<-read.table("household_power_consumption.txt",
                 header = TRUE,
                 sep = ";", na.strings = "?")

data$Date<-as.Date(data$Date, "%d/%m/%Y")
data<-data[as.Date("2007-02-01")<= data$Date & 
             data$Date<=as.Date("2007-02-02"),]

x <- paste(data$Date, data$Time)
data$Time<-strptime(x, "%Y-%m-%d %H:%M:%S")
colnames(data)[2] <- "Date/Time"

hist(data[,3], col = "red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.copy(png,'plot1.png')
dev.off()
