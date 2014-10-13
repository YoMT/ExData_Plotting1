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

# Open the graphics device -  png file

png("plot3.png",width = 480, height = 480)

#plot graph

plot(newtime2, df$Sub_metering_1, "l",col=plot_colors[1], xlab="", ylab="Energy sub metering")

# add sub_metering_2 and sub_metering_3 to the graph
    
lines(newtime2, df$Sub_metering_2, "l", xlab="",col=plot_colors[2] )
lines(newtime2, df$Sub_metering_3, "l", xlab="",col=plot_colors[3])

#add legend anotation to the graph 
    
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close the graphics device
dev.off()


