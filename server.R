library(shiny)


# import the tooth growth data
data("ToothGrowth")
teethModel <- lm(len ~ supp + dose, data=ToothGrowth)

# predict the tooth growth for given supplement and  dose
predictToothGrowth <- function(supp, dose) {
        predict(teethModel, newdata=data.frame(supp=supp, dose=dose))
}

# map supp names
suppNames <- c(
        "VC" = "Ascorbic acid",
        "OJ" = "Orange juice"
)


shinyServer(function(input, output) {
        output$predVars <- renderPrint({paste(
                "Predicted tooth length for", 
                suppNames[input$supp], 
                "with a dose of", 
                input$dose,
                "mg/day")})
        output$lenPred <- renderPrint({predictToothGrowth(input$supp, input$dose)})
})
