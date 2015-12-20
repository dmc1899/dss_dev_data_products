library(shiny)

shinyUI(pageWithSidebar(

    headerPanel("Predict the MPG of your vehicle"),

    sidebarPanel(
        helpText("1. Select the transmission type of your vehicle."),
        selectInput("transmission", "Transmission:", c("Automatic" = "Automatic","Manual" = "Manual")),
        
        helpText("2. Select from 100-250 for the horsepower of your vehicle."),
        sliderInput('horsepower','Horsepower:', value = 100, min = 80, max = 250, step=10,),
        
        helpText("3. Select from 4-8 for the number of cylinders of your vehicle."),
        numericInput('cylinders', 'Cylinders:', 4, min = 4, max = 8, step = 2),
        
        helpText("4. Enter the weight in tonnes of your vehicle."),
        numericInput('weight', 'Weight (Tonnes):', 1.513, min = 0.95, max = 5.424, step = 0.001),
        
        helpText("5. Press here to receive an estimate of your likely miles per gallon."),
        actionButton("goButton", "Predict MPG")
    ),
    
    mainPanel(
        # Help text and instructions.
        helpText("This data product allows you to predict the MPG of your vehicle using a linear model built with the mtcars dataset.  Follow the steps on the left hand side to predict your MPG value. Once entered, the vehicle info is captured using:"),
        code('vehicle  <- data.frame(cyl=as.factor(input$cylinders), hp=input$horsepower, wt=input$weight, am=input$transmission)'),
        helpText("The built model is then used to predict the MPG with the vehicle data, using:"),
        code('mpg  <- predictMpgForVehicle(model,vehicle)'),
        helpText("The underlying function used is 'predict' from the stats package:"),
        code('predictMpgForVehicle  <- function(best_model, vehicle){predict(best_model,newdata=vehicle)}'),
        
        h4('Transmission Type Selected:'),
        verbatimTextOutput('transmission'),
        
        h4('Horsepower Selected:'),
        verbatimTextOutput('horsepower'),
        
        h4('Cylinders Selected:'),
        verbatimTextOutput('cylinders'),
        
        h4('Weight Selected:'),
        verbatimTextOutput('weight'),
        
        h3('Predicted MPG Value:'),
        verbatimTextOutput('prediction')
        
    )
))