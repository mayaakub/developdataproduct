library(shiny)

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    headerPanel("EDW Storage History"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with one input
      sidebarPanel(
        uiOutput("inputYear"),
        uiOutput("inputMonth"),    
        hr(),
        helpText("by mayaakub@yahoo.com"),
        a(href="slides.html","ReadMe",target="_blank")
      )
    ,
      
      # Create a spot for the plots
      mainPanel(
        tabsetPanel(
          tabPanel("Bar",plotOutput("BarPlot")),
          tabPanel("Line",plotOutput("LinePlot")),
          tabPanel("Pie",plotOutput("PiePlot")),
          tabPanel("Data",verbatimTextOutput("DataBase"))
        )
      )
    )
  )
)

