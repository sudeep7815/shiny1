library(shiny)
library(tidyverse)
library(janitor)

ui <- fluidPage(
  textOutput("total_cases"),
  tableOutput("year_wise_table")
)

server <- function(input, output, session) {
  
  data1 <- reactive({
    read_csv("10_Property_stolen_and_recovered.csv") %>% 
      clean_names()
  })
  
  data2 <- reactive({
    data1() %>% 
      rename(state_ut = area_name)
  })
  
  data3 <- reactive({
    data2() %>% 
      filter(group_name != "Total Property")
  })
  
  output$total_cases <- renderText({
    v <- data3() %>% 
      pull(cases_property_stolen) %>% 
      sum(na.rm = TRUE)
    
    paste0("Total no of cases stolen: ", v)
  })
}

shinyApp(ui, server)
