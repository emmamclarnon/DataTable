# Load the ggplot2 package which provides
# the 'mpg' dataset.
setwd("C:/Users/AT003502/Documents/Emma/FB dashboard/facebook data with organic likes/table_test/")

Deskpro<-read.csv("DeskPro.csv", header=T)


#dataset=Deskpro

#fluidPage(
  
  # App title ----
#  titlePanel("Deskpro Services"),
#  conditionalPanel(
#    'input.dataset === "Deskpro"',
#    helpText("Click the column header to sort a column.")
#  ),
    # Main panel for displaying outputs ----
#    mainPanel(
#        tabsetPanel(
#          id = 'Deskpro',
#          tabPanel("Deskpro", DT::dataTableOutput("mytable1"))
#        )
#    )
#)
# Load the ggplot2 package which provides
# the 'mpg' dataset.
library(ggplot2)

fluidPage(
  titlePanel("Basic DataTable"),
  dateRangeInput('daterange', "Date Range:",start="2017-12-25", end="2017-12-31"),
 fluidRow(
   column(width=7,
          box(width=12,solidHeader=T,title="Number of Reported Issues by Service",
              collapsible = T,collapsed = F,
              selectInput("Service",
                          "Service:",
                          c("All",
                            unique(as.character(URL_count2$Service)))),       
              DT::dataTableOutput("table")
              
              
          )
     
  #  )))
      
  #  ))%>% formatStyle(
  #    'V1', 'V6',
 #     backgroundColor = styleEqual(c(0, 1), c('gray', 'yellow'))
    )
    )
  )
#)

# Filter data based on selections
#output$table <- DT::renderDataTable(DT::datatable(rownames=F,{
 # data <-URL_count
  #if (input$Service != "All") {
 #   data <- data[data$Service == input$Service,]
 # }
 # data
#}))




