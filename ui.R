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
  
  # Create a new Row in the UI for selectInputs
  fluidRow(
    column(4,
           selectInput("Service",
                       "Service:",
                       c("All",
                         unique(as.character(Deskpro$Service))))
    )
  ),
    #)#,
    ##column(1,
    #       selectInput("Ticket",
     #                  "Type of request:",
    #                   c("All",
    #                     unique(as.character(Deskpro$Ticket))))
   # )
 # ),
  # Create a new row for the table.
  fluidRow(
    DT::dataTableOutput("table")
    )
  )
#)