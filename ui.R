library(shiny)

shinyUI(fluidPage(
        # Application title
        titlePanel("Teeth growth in Guinea pigs through suplementing vitamin C"),
        
        # Description
        p("This application let you predict the tooth length of a guinea pig given different amounts of vitamin C supplmentation of different kinds."),
        
        # Sidebar with a slider input for number of bins
        sidebarLayout(
                sidebarPanel(
                        h4("Set a Vitamin C dose"),
                        sliderInput("dose",
                                "C Vitamin dose (mg/day):",
                                min = 0.5,
                                max = 2,
                                value = 1,
                                step = 0.1),
                        
                        h4("Pick a vitamin source"),
                        selectInput("supp", "Supplement type:",
                                c("Orange juice" = "OJ",
                                "Ascorbic acid" = "VC")),
                        
                        submitButton("Submit")
                ),
                
                mainPanel(
                        h3("Prediction results"),
                        h4("You chose"),
                        verbatimTextOutput("predVars"),
                        
                        h4("Which gave a tooth length of"),
                        verbatimTextOutput("lenPred")
                )
        )
))
