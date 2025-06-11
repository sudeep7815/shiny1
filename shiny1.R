library(shiny)

ui <- fluidPage(
  h1("Hello World"),
  h2("Hello World"),
  h3("Hello World"),
  h4("Hello World"),
  p("this is paragraph,
    Shiny is R package that make it easy to build to interactive web applications(apps) straight from R. This lesson will get you started building Shiny apps right away.If you still haven’t installed the Shiny package, open an R session, connect to the internet, and run")
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)