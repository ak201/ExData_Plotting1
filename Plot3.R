getwd()
##getting the file

p3 <- read.csv("C:/Users/amank/Downloads/Exploratory_Analysis_Courseproject1/household_power_consumption.txt",na.strings = "?",stringsAsFactors = F,header = T,sep = ';')

p3$Date <- as.Date(p3$Date,format="%d/%m/%Y")

subp3 <- subset(p3,subset = (Date>="2007-02-01" & Date <="2007-02-02"))
rm(p3)

dt3 <- paste(as.Date(subp3$Date),subp3$Time)
subp3$Datetime <- as.POSIXct(dt3)

globalpower3 <- as.numeric(subp3$Global_active_power)
submeter1 <- as.numeric(subp3$Sub_metering_1)
submeter2 <- as.numeric(subp3$Sub_metering_2)
submeter3 <- as.numeric(subp3$Sub_metering_3)

with(subp3,{plot(submeter1~Datetime,type="l",ylab = "Energy sub metering",xlab=" ")
  lines(submeter2~Datetime,col="red")
  lines(submeter3~Datetime,col="blue")
  })

legend("topright",col = c("black","red","blue"),lty=1,lwd=1.5,cex=0.5,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,file="PLot4.png",height=480,width=480)
dev.off()