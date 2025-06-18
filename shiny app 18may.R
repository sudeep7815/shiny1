library(shiny)
library(tidyverse)
library(janitor)
ui <- fluidPage(
  
  selectInput("sel","choose species",choices = c('setosa','versicolor','virginica')),
  plotOutput("p1"),
  tableOutput("tbl1")
)

server <- function(input, output, session) {
  
  output$p1 <-renderPlot({
    iris %>% 
      filter(Species == input$sel) %>% 
      ggplot(aes(Sepal.Width,Sepal.Length))+
      geom_point()
  })
  
  output$tbl1 <- renderTable({
    iris %>% 
      filter(Species == input$sel)
  })
}

shinyApp(ui, server)

