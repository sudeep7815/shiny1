library(shiny)

ui <- fluidPage(
  numericInput("num1","D",value = 8),
  numericInput("num2","E",value = 1),
  numericInput("num3","F",value = 2),
  textOutput("sumabc")
)

server <- function(input, output, session) {
  output$sumabc<-renderText({
    print(class(input$sum1))
        input$num1 + input$num2 + input$num3
  })
}

shinyApp(ui, server)