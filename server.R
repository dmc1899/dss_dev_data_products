library(shiny)
library(UsingR)
data(mtcars)

buildLinearModelForMpgPrediction  <- function(){
    
    mtcarscopy  <- mtcars
    
    mtcarscopy$cyl <- factor(mtcarscopy$cyl) 
    mtcarscopy$vs <- factor(mtcarscopy$vs)
    mtcarscopy$gear <- factor(mtcarscopy$gear)
    mtcarscopy$carb <- factor(mtcarscopy$carb)
    mtcarscopy$am  <- factor(mtcarscopy$am, labels = c("Automatic","Manual"))
    
    full_model <- lm(mpg ~ ., data = mtcarscopy)
    best_model <- step(full_model, direction = "both")
    best_model
}

predictMpgForVehicle  <- function(best_model, vehicle){
    predict(best_model,newdata=vehicle)
}

model   <-  buildLinearModelForMpgPrediction()

shinyServer(
    function(input, output) {
                # Store the transmission that was selected.
                output$transmission  <- renderText({input$transmission})
                
                # Store the horsepower that was selected.
                output$horsepower  <- renderText({input$horsepower})
                
                # Store number of cylinders selected.
                output$cylinders  <- renderText({input$cylinders})
                
                # Store weight selected.
                output$weight  <- renderText({input$weight})
                
                # Return the prediction of MPG on button press only.
                output$prediction <- renderText({
                    if (input$goButton == 0) ""
                    else {
                        isolate({
                            vehicle  <- data.frame(cyl=as.factor(input$cylinders), hp=input$horsepower, wt=input$weight, am=input$transmission)
                            mpg  <- predictMpgForVehicle(model,vehicle)
                            mpg})
                    }
                })
                
    }
)