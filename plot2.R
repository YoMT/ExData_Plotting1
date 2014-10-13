input<-"household_power_consumption.txt"

#read file into variable name "DF"

DF<-read.table(input, sep=";", header=TRUE, na.strings = "?", stringsAsFactors=TRUE)

#format date   

DF$FormatedDate<-as.Date(DF$Date, "%d/%m/%Y")

#get subset of the data frame where date is equalto the first an second date of February       

df<-subset(DF, FormatedDate==as.Date("2007-02-01") | FormatedDate==as.Date("2007-02-02"))

#concatinate date and time and save it as new variable

newtime1<-paste(df$Date, df$Time, sep=",")

#converts character vecorst(newtime1 to class

newtime2<-strptime(newtime1, "%d/%m/%Y,%H:%M:%S")

#set the color of the pot to red

plot_colors <- c("Red")

# Open the graphics device -  png file

png("plot2.png",width=480, height=480)

#plot data

plot(newtime2, df$Global_active_power, "l", xlab="", ylab="Global Active Power(kilowatts)")

# Close the graphics device
dev.off()