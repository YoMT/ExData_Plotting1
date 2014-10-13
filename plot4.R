##Coursera - Datascience Exploratory Data Analysis

# the code crates a png file for graph of three energy sub-metering variables
# vs time

#save path and name of source of data to be plotted
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

plot_colors <- c("Black","Red","Blue")

#create ploting device - as png file

png("plot4.png",width = 480, height = 480)

#set the graphical parameter for 2 row by 2 column
    par(mfcol=c(2, 2))

#plot graph
    
    plot(newtime2,df$Global_active_power,col=plot_colors[1], "l", xlab="", ylab="Global Active Power")
    
    plot(newtime2, df$Sub_metering_1, "l",col=plot_colors[1], xlab="", ylab="Energy sub metering")

# add sub_metering_2 and sub_metering_3 to the graph
    
lines(newtime2, df$Sub_metering_2, "l", xlab="",col=plot_colors[2] )
lines(newtime2, df$Sub_metering_3, "l", xlab="",col=plot_colors[3])


#add legend anotation to the graph 
    
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

    # plot voltage vs datetime
plot(newtime2, df$Voltage,"l", xlab="datetime", ylab="Voltage")
    
    # plot Global_reactive_power vs datetime
plot(newtime2, df$Global_reactive_power, "l", xlab="datetime", ylab="Global_reactive_power")

    # Close the graphics device
dev.off()


