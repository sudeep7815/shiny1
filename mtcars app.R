library(shiny)

ui <- fluidPage(
  selectInput("sel","select",choices = c(3,4,5)),
  plotOutput("p1"),
  plotOutput("p2")
)

server <- function(input, output, session) {
  data1 <-reactive({
    mtcars %>% 
      filter(gear == input$sel)
  })
  
  output$tb1 <-renderTable({
    data1()
  })
  
  output$p1<-renderPlot({
    data2() %>% 
      ggplot(aes(x = am, y = avg_mpg))+
      geom_col()
  })
  
  output$p2<-renderPlot({
    data1() %>% 
      ggplot(aes(x = hp, y = disp))+
      geom_point()
  })
  
  output$p2 <-  renderPlot()
  data1() %>% 
    ggplot()
}

shinyApp(ui, server)

