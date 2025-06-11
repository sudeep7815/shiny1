library(tidyverse)
library(janitor)
library(ggplot2)
library(shiny)

ui <- fluidPage(
  tableOutput("tb2")
)

server <- function(input, output, session) {
  data1 <- reactive({
    "INDIA-AQI-DATA-2015-2020.csv" %>% 
      read_csv() %>% 
      clean_names() -> aqidf1
  })
  output$tb2 <- renderTable({
    data1()
  })
}

shinyApp(ui, server)