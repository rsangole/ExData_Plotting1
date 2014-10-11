library(dplyr)
#Read raw data
data <- read.table("household_power_consumption.txt",sep = ";",
                   header = T,na.strings = "?")
#Prefer using dplyr
df <- tbl_df(data)
#Convert date column to 'Date' datatype
df$Date <- as.Date(df$Date,"%d/%m/%Y")
#Filter required columns
df <- filter(df,Date>="2007-02-01"&Date<="2007-02-02")
#Save to png file
png(filename = "plot1.png") #Default width & ht is 480
hist(df$Global_active_power,
      main="Global Active Power",
      xlab="Global Active Power (kilowatts)",
      col="red")
dev.off()
