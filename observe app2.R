library(shiny)
library(tidyverse)
library(janitor)

ui <- fluidPage(
  
  actionButton("click",label = "click"),
  plotOutput("p1")
  
)

server <- function(input, output, session) {
  
  data1 <- reactive({
    print("In data1")
    tibble(x = 1:10)
  })
  
  data2 <- reactive({
    print("In data2")
    data1() %>% 
      mutate(y = 11:20)
  })
  
  data3 <- reactive({
    print("In data3")
    data2 %>% 
      mutate(z = c(rep("a",5),rep("b",5)))
  })
  
  observeEvent(input$click,{
    print(paste0("button clicked",input$click))
    output$p1<- renderPlot({
      print("In renderplot p1")
      data3() %>% 
        ggplot(aes(x,y,color = z))+
        geom_point(size = 10)
    })
    
  })
}

shinyApp(ui, server)

