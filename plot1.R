##Coursera - datascience Exploratory Data Analysis

#save path and name of source of data to be plotted
input<-"./hldpc/household_power_consumption.txt"

#read file into variable name "DF"

DF<-read.table(input, sep=";", header=TRUE, na.strings = "?", stringsAsFactors=TRUE)

#format date        
DF$Date<-as.Date(DF$Date, "%d/%m/%Y")

#get subset of the data frame where date is equalto the first an second date of February       
df<-subset(DF, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))

df$Global_active_power <-as.numeric(df$Global_active_power)

#set the color of the pot to red
plot_colors <- c("Red")

#Save plot as png file
png("plot1.png",width=480, height=240)

#plot a histogram 

hist(df$Global_active_power,col=plot_colors[1], xlab="Global Active Power(Kilowatts)",
     main="Global Active Power")
dev.off()