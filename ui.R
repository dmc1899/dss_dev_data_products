library(shiny)

shinyUI(pageWithSidebar(
    
    headerPanel("MPG Prediction Data Product"),
    
    sidebarPanel(
        
        selectInput("transmission", "Transmission:", c("Automatic" = "Automatic","Manual" = "Manual")),
        sliderInput('horsepower','Horsepower:', value = 100, min = 80, max = 250, step=10,),
        numericInput('cylinders', 'Cylinders:', 4, min = 4, max = 8, step = 2),
        numericInput('weight', 'Weight (Tonnes):', 1.513, min = 0.95, max = 5.424, step = 0.001),
        actionButton("goButton", "Predict MPG")
        ),
    
    mainPanel(

        h4('Transmission Type Selected:'),
        verbatimTextOutput('transmission'),
        
        h4('Horsepower Selected:'),
        verbatimTextOutput('horsepower'),
        
        h4('Cylinders Selected:'),
        verbatimTextOutput('cylinders'),
        
        h4('Weight Selected:'),
        verbatimTextOutput('weight'),
        
        h3('MPG Value Returned:'),
        verbatimTextOutput('prediction')

        )
))