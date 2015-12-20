library(shiny)

shinyUI(pageWithSidebar(

    headerPanel("Predict the MPG of your car"),

    sidebarPanel(
        helpText("1. Select the transmission type of your car."),
        selectInput("transmission", "Transmission:", c("Automatic" = "Automatic","Manual" = "Manual")),
        
        helpText("2. Select from 100-250 for the horsepower of your car."),
        sliderInput('horsepower','Horsepower:', value = 100, min = 80, max = 250, step=10,),
        
        helpText("3. Select from 4-8 for the number of cylinders of your car."),
        numericInput('cylinders', 'Cylinders:', 4, min = 4, max = 8, step = 2),
        
        helpText("4. Enter the weight in tonnes of your car."),
        numericInput('weight', 'Weight (Tonnes):', 1.513, min = 0.95, max = 5.424, step = 0.001),
        
        helpText("5. Press here to receive an estimate of your likely miles per gallon."),
        actionButton("goButton", "Predict MPG")
    ),
    
    mainPanel(
        helpText("This data product makes use of the linear regression modelling technique and the mtcars dataset to fit a model which will predict MPG performance based on four indepentent variables.  Follow ordered instructions on the left hand side to calculate a value for the likely MPG of your vehicle."),
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