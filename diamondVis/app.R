library(shiny)
library(ggplot2)

# Shiny widgets Gallery give you more info
# Shiny skeleton (two things: ui and server)
# user interface

ui <- fluidPage(
  titlePanel("Diamonds Data", windowTitle = "Diamonds"),
  sidebarLayout(
    sidebarPanel(
      helpText("This app is to visualize diamonds dataset"),
      textInput(inputId = "title", 
                label = "Chart Title", 
                value = ""),
      selectInput(inputId = "pos",
                  label = "Position",
                  choices = list("stack", "dodge"),
                  selected = "stack")
    ),
    mainPanel(
      plotOutput(outputId = "plot")
    )
  )
)

# Server

server <- function(input, output){
  
  output$plot = renderPlot(
  ggplot(diamonds, aes(x = cut, fill = clarity)) +
    geom_bar(position = input$pos) +
    ggtitle(input$title)
  )
  
}

# run the app
shinyApp(ui, server)

