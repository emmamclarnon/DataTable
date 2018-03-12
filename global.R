library(ggplot2)
setwd("C:/Users/AT003502/Documents/Emma/FB dashboard/facebook data with organic likes/table_test/")

Deskpro<-read.csv("DeskPro.csv", header=T)
Deskpro2<-Deskpro[Deskpro$Referrer.URL!="n/a",]
#str(Deskpro2)#
hourly_tick<-as.POSIXlt(Deskpro2$Timestamp, format="%d/%m/%Y %H:%M")
#hourly_tick<-data.frame(hourly_tick, Deskpro2$Referrer.URL)
str(Deskpro2)
Deskpro2$hourly_tick<-hourly_tick
#URL_count<-aggregate(data.frame(count=Deskpro2$Referrer.URL), list(value=Deskpro2$Referrer.URL, Deskpro2$Service, Deskpro2$Timestamp),length)
URL_count2<-aggregate(list(count=Deskpro2$Referrer.URL),list(value=Deskpro2$Referrer.URL, Deskpro2$Service,time_st=cut(Deskpro2$hourly_tick, "1 hour")),length)
head(URL_count2,50)
#str(URL_count2)
URL_count2<-URL_count2[order(-URL_count2$count),]
names(URL_count2)=c("URL", "Service","Date.Time.Stamp","Count")
##URL_count=URL_count[c("Service", "Count", "URL")]
URL_count2=data.frame(URL_count2$Service, URL_count2$Date.Time.Stamp,URL_count2$Count, URL_count2$URL)
URL_count2
names(URL_count2)=c("Service", "Date & Time stamp","Reported issues","URL")
data <-URL_count2


#data %>%
#  filter(date > input$daterange[1],
 #        date < input$daterange[2])