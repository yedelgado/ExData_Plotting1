> library(readr)
> datosR <- read_delim("Coursera/Exploratory Data analysis/datosR.txt", 
+     ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y")), 
+     locale = locale(), trim_ws = TRUE)
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
> frecuencia<-subset(datosR, datosR$Date>=as.Date('2007-02-01',format="%Y-%m-%d") & datosR$Date<= as.Date('2007-02-02',format="%Y-%m-%d"))
> dim(frecuencia)
[1] 2880    9
> hist(as.numeric(frecuencia$Global_active_power), col= "red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")