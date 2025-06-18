library(shiny)
library(DT)

ui <- fluidPage(
  dataTableOutput("tb1")
 #tableOutput("tb1")
  
)

server <- function(input, output, session) {
  
  output$tb1<-renderDataTable({
    data.frame(x = 1:10000,
               y = 1:10000)
  })
}

shinyApp(ui, server)