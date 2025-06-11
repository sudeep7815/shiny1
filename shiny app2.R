library(shiny)

ui <- fluidPage(
    fluidRow(
      column(6, h1("Shiny is R package that make it easy to build to interactive web applications(apps) straight from R. This lesson will get you started building Shiny apps right away.If you still haven’t installed the Shiny package, open an R session, connect to the internet, and run")),
      column(2, h1("Shiny is R package that make it easy to build to interactive web applications(apps) straight from R. This lesson will get you started building Shiny apps right away.If you still haven’t installed the Shiny package, open an R session, connect to the internet, and run")),
      column(2, h1("Shiny is R package that make it easy to build to interactive web applications(apps) straight from R. This lesson will get you started building Shiny apps right away.If you still haven’t installed the Shiny package, open an R session, connect to the internet, and run")),
      column(2, h1("Shiny is R package that make it easy to build to interactive web applications(apps) straight from R. This lesson will get you started building Shiny apps right away.If you still haven’t installed the Shiny package, open an R session, connect to the internet, and run"))
             )
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)