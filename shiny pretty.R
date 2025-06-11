library(shiny)

# Define UI
ui <- fluidPage(
  titlePanel("🎉 Custom Greeting Generator"),
  
  sidebarLayout(
    sidebarPanel(
      textInput("name", "Enter your name:", value = ""),
      actionButton("generate", "Generate Greeting")
    ),
    
    mainPanel(
      h3("Your Greeting:"),
      verbatimTextOutput("greeting_output")
    )
  )
)

# Define Server Logic
server <- function(input, output) {
  
  generate_greeting <- reactive({
    req(input$name)  # Ensure name is entered
    
    name <- input$name
    hour <- as.numeric(format(Sys.time(), "%H"))
    
    if (hour < 12) {
      greeting <- "Good morning"
    } else if (hour < 17) {
      greeting <- "Good afternoon"
    } else {
      greeting <- "Good evening"
    }
    
    return(paste(greeting, name, "! Hope you're having a FUCKING BLAST day and enjoying every moment in your life 
                 be safe and stay healthy happy my dear friend Hellooo you beautiful disaster! Just here to sprinkle 
                 some nonsense into your day. May your phone always be charged, your food always be spicy, and your
                 mood always be slightly unhinged (the fun kind). Stay weird, stay fabulous, and 
                 most importantly – don’t forget to laugh at your own jokes because, let’s face it, you’re the only one who will..
                                                                                                by beloved Friend"))
  })
  
  output$greeting_output <- renderText({
    input$generate  # Trigger reactivity when button is clicked
    isolate(generate_greeting())  # Avoid auto-refresh on typing
  })
}

# Run the app
shinyApp(ui = ui, server = server)
