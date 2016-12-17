getwd()
##getting the file

p4 <- read.csv("C:/Users/amank/Downloads/Exploratory_Analysis_Courseproject1/household_power_consumption.txt",na.strings = "?",stringsAsFactors = F,header = T,sep = ';')

p4$Date <- as.Date(p4$Date,format = "%d/%m/%Y")


subp4 <- subset(p4,subset = Date >="2007-02-01" & Date<= "2007-02-02")
rm(p4)

dt4 <- paste(as.Date(subp4$Date),subp4$Time)
subp4$Datetime <- as.POSIXct(dt4)

globalpower4 <- as.numeric(subp4$Global_active_power)
globalreactive <- as.numeric(subp4$Global_reactive_power)
submeter01 <- as.numeric(subp4$Sub_metering_1)
submeter02 <- as.numeric(subp4$Sub_metering_2)
submeter03 <- as.numeric(subp4$Sub_metering_3)
volt <- as.numeric(subp4$Voltage)

par(mfrow=c(2,2),mar =c(4,4,2,1),oma=c(0,0,2,0))

with(subp4,{plot(globalpower4~Datetime,type="l",xlab =" ",ylab = "Global Active Power")
            plot(volt~Datetime,type="l",xlab="Datetime",ylab = "Voltage")
            plot(submeter01~Datetime,type="l",ylab = "Energy Sub Metering")
            lines(submeter02~Datetime,col="red")
            lines(submeter03~Datetime,col="blue")
            legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="o",cex = 0.4)
            plot(globalreactive~Datetime,type="l",xlab="Datetime",ylab = "Global_Reactive_Power")  })



##saving the file
dev.copy(png,file="PLot4.png",height=480,width=480)
dev.off()
