#function(input, output) {
  
  # choose columns to display

#  output$mytable1 <- DT::renderDataTable({
#    DT::datatable(Deskpro)
#  })
  
#}
# Load the ggplot2 package which provides
# the 'mpg' dataset.
library(ggplot2)
setwd("C:/Users/AT003502/Documents/Emma/FB dashboard/facebook data with organic likes/table_test/")

Deskpro<-read.csv("DeskPro.csv", header=T)
Deskpro2<-Deskpro[Deskpro$Referrer.URL!="n/a",]
#str(Deskpro2)
URL_count<-aggregate(data.frame(count=Deskpro2$Referrer.URL), list(value=Deskpro2$Referrer.URL, Deskpro2$Service),length)
head(URL_count,10)
str(URL_count)
URL_count<-URL_count[order(-URL_count$count),]
names(URL_count)=c("URL", "Service","Count")
##URL_count=URL_count[c("Service", "Count", "URL")]
URL_count=data.frame(URL_count$Service, URL_count$Count, URL_count$URL)
URL_count
names(URL_count)=c("Service", "Reported issues","URL")

function(input, output) {
  
  # Filter data based on selections
  # Filter data based on selections
  output$table <- DT::renderDataTable(DT::datatable(rownames=F,options=list(
      initComplete = JS(
                                                      "function(settings, json) {",
                                                      "$(this.api().table().header()).css({'background-color': '#038fd2', 'color': '#fff'});",
                                                      "}")
  ),
                                                  
                                                    {
    data <-URL_count
    if (input$Service != "All") {
      data <- data[data$Service == input$Service,]
    }
    data
  }))
}