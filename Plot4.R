library(readr)
> datosR <- read_delim("Coursera/Exploratory Data analysis/datosR.txt", 
+     ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y")), 
+     trim_ws = TRUE)
|==========================================================================| 100%  126 MB
Warning: 155874 parsing failures.
 row                   col expected actual                                            file
6840 Global_active_power   a double      ? 'Coursera/Exploratory Data analysis/datosR.txt'
6840 Global_reactive_power a double      ? 'Coursera/Exploratory Data analysis/datosR.txt'
6840 Voltage               a double      ? 'Coursera/Exploratory Data analysis/datosR.txt'
6840 Global_intensity      a double      ? 'Coursera/Exploratory Data analysis/datosR.txt'
6840 Sub_metering_1        a double      ? 'Coursera/Exploratory Data analysis/datosR.txt'
.... ..................... ........ ...... ...............................................
See problems(...) for more details.

> View(datosR)
> datosR$Date <- as.Date(datosR$Date, "%d/%m/%Y")
> datosR <- subset(datosR,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
> datosR <- datosR[complete.cases(datosR),]
> dateTime <- paste(datosR$Date, datosR$Time)
> dateTime <- setNames(dateTime, "DateTime")
> datosR <- datosR[ ,!(names(datosR) %in% c("Date","Time"))]
> datosR <- cbind(dateTime, datosR)
> datosR$dateTime <- as.POSIXct(dateTime)
> par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
> with(datosR, {
+     plot(Global_active_power~dateTime, type="l",
+          ylab="Global Active Power (kilowatts)", xlab="")
+     plot(Voltage~dateTime, type="l",
+          ylab="Voltage (volt)", xlab="")
+     plot(Sub_metering_1~dateTime, type="l",
+          ylab="Global Active Power (kilowatts)", xlab="")
+     lines(Sub_metering_2~dateTime,col='Red')
+     lines(Sub_metering_3~dateTime,col='Blue')
+     legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
+            legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
+     plot(Global_reactive_power~dateTime, type="l",
+          ylab="Global Rective Power (kilowatts)",xlab="")
+ })