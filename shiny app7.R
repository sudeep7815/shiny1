library(shiny)

ui <- fluidPage(
  selectInput("species","select species",choices = c("setosa","versicolor","virginica")),
  plotOutput("speciesplot"),
  tableOutput("speciestable")
)

server <- function(input, output, session) {
  
  speciesdata<- reactive({
    iris %>% 
      filter(Species == input$species)
  })
  
  output$speciesplot <- renderPlot({
    speciesdata() %>% 
      ggplot(aes(x = Sepal.Length, y = Sepal.Width))+
      geom_point()
  })
  
  output$speciestable <- renderTable({
    iris %>% 
      filter(Species == input$species)
  })
}

shinyApp(ui, server)