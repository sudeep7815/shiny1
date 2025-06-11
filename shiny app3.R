library(shiny)

ui <- fluidPage(
  titlePanel("Sidebar layout"),
  sidebarLayout(
    sidebarPanel(
      h1("T1")
    ),
    mainPanel(
      h1("T2")
    )
  )
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)