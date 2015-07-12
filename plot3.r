power<-read.table("./household_power_consumption.txt",sep=";",header=T)  #read the table
#change Date and time cloumn to POSIXlt fromat
power$Datetime<-paste(power$Date,power$Time)
power$Datetime<-as.POSIXlt(strptime(power$Datetime,"%d/%m/%Y %H:%M:%S"))
format(power$Timen,"%H:%M:%S")
# select data in "2007-02-01" ,"2007-02-02"
start<-as.Date("2007-02-01")
end<-as.Date("2007-02-02")
range <- seq(start,end,"day")
sub<-power[as.Date(strptime(power$Date,"%d/%m/%Y"))==range,]
#draw the picture
png("./plot3.png",width = 480, height = 480)
plot(sub$Datetime,as.numeric(sub$Sub_metering_1),type="l",lty=1,xlab="",ylim=c(0,40),ylab="Energy sub Metering")
par(new=T)
plot(sub$Datetime,as.numeric(sub$Sub_metering_2),type="l",lty=1,xlab="",ylim=c(0,40),ylab="",col="red")
par(new=T)
plot(sub$Datetime,as.numeric(sub$Sub_metering_3),type="l",lty=1,xlab="",ylim=c(0,40),ylab="",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
dev.off()
