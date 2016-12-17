getwd()

##getting the file 
p2 <- read.csv("C:/Users/amank/Downloads/Exploratory_Analysis_Courseproject1/household_power_consumption.txt",na.strings = "?",stringsAsFactors = F,header = T,sep = ';')

p2$Date <- as.Date(p2$Date,format = "%d/%m/%Y")

subp2 <- subset(p2,subset = (Date >="2007-02-01" & Date<="2007-02-02"))
rm(p2)

dt2 <- paste(as.Date(subp2$Date),subp2$Time)
subp2$Datetime <- as.POSIXct(dt2)


globalpower2 <- as.numeric(subp2$Global_active_power)

##plotting the graph using the plot function
plot(globalpower2~subp2$Datetime,type="l",ylab = "Global Active Power(Kilowatts)",xlab=" ")


##saving the file
dev.copy(png,file="Plot2.png",height=480,width=480)
dev.off()
                