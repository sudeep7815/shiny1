library(shiny)
library(DT)
library(tidyverse)

ui <- fluidPage(
  selectInput("Select", "Choose the gear", choices = c(5,4,3)),
  actionButton("btn1", "Generate Table"),
  actionButton("btn2", "Generate Plot"),
  tableOutput("tab2"),
  plotOutput("plot1"),
  plotOutput("plot2")
)

server <- function(input, output, session) {
  
  data1 <- reactive({
    mtcars %>% 
      filter(gear == input$Select)
  })
  data2 <- reactive({
    data1() %>% 
      group_by(am) %>% 
      summarize(avg_mpg = mean(mpg , na.rm = T))
    
  })
  
  observeEvent(input$btn1,{
    output$tab2 <-renderTable({
      data1()
    })
  }
  )
  
  
  observeEvent(input$btn2,{
    output$plot1 <-renderPlot({
      data1() %>%
        ggplot(aes(hp, disp))+
        geom_point()
    })
    
    output$plot2 <- renderPlot({
      data2() %>% 
        ggplot(aes(am, avg_mpg))+
        geom_col()
    })
  })}
shinyApp(ui, server)