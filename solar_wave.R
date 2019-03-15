library(data.table)
library(forecast)
library(ggplot2)
library(plotly)

Sunspots <- fread("noaa.csv")
colnames(Sunspots) <-c("Idx","Ymd","Spots")
Sunspots$Ymd <-as.Date(Sunspots$Ymd)
Sunspots$Ma <- ma(Sunspots$Spots, order=60)
str(Sunspots)
summary(Sunspots)
gg <-ggplot(data=Sunspots,aes(x=Ymd,y=Ma)) + 
  geom_line()  + geom_smooth() +ggtitle("60 Day Moving Average: 1947-2019(Feb.)") 
##
## Convert ggplot2 to plot_ly plot
ggplotly(gg)
#
