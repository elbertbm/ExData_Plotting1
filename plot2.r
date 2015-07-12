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
png("./plot2.png",width = 480, height = 480)
plot(sub$Datetime,as.numeric(sub$Global_active_power)/1000,type="l",lty=1,xlab="",ylab="Global active power(kilowatts)")
dev.off()
