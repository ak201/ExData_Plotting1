getwd()
cp <- read.csv("C:/Users/amank/Downloads/Exploratory_Analysis_Courseproject1/household_power_consumption.txt",na.strings = "?",stringsAsFactors = F,header = T,sep=';')

cp$Date <- as.Date(cp$Date,format="%d/%m/%Y")

subcp <- subset(cp,subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(cp)

dt <- paste(as.Date(subcp$Date),subcp$Time)
subcp$Datetime <-as.POSIXct(dt)



globalpower <- as.numeric(subcp$Global_active_power)
hist(globalpower,main = "Global Active Power",xlab ="Global Active Power(Kilowatts)",ylab ="Frequency",col="red")


##Copying the file in png format
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()
