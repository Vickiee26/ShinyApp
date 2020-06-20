
library(shiny)

shinyUI(fluidPage(
    titlePanel("Height Pediction"),
    sidebarLayout(
        sidebarPanel(
            helpText("Prediction of Diamond's Price"),
            helpText("Parameters:"),
            sliderInput(inputId = "carat",
                        label = "Weight of the diamond (carat):",
                        value = 0.20,
                        min = 0.20,
                        max = 2.17,
                        step = 0.01),
            
            selectInput(inputId = "cut",
                        label = "Cut", 
                        choices = c("Ideal", "Premium", "Good", "Very Good", "Fair")),
            
            selectInput(inputId = "color",
                        label = "Color", 
                        choices = c("D", "E", "F", "G", "H", "I", "J")),
            
            selectInput(inputId = "clarity",
                        label = "Clarity", 
                        choices = c("SI2", "SI1", "VS1", "VS2", "VVS2", "VVS1", "I1", "IF")),
            
            sliderInput(inputId = "depth",
                        label = "Width of top of diamond relative to widest point:",
                        value = 43,
                        min = 43,
                        max = 79,
                        step = 0.5),
            
            sliderInput(inputId = "table",
                        label = "Width of top of diamond relative to widest point:",
                        value = 43,
                        min = 43,
                        max = 95,
                        step = 2),
            
            textInput(inputId = "x",
                      label = "Length in mm (x):",
                      value = "0.00"),
            
            textInput(inputId = "y",
                      label = "Width in mm (y):",
                      value = "0.00"),
            
            textInput(inputId = "z",
                      label = "Depth in mm (z):",
                      value = "0.00")
        ),
        
        mainPanel(
            htmlOutput("Title1"),
            plotOutput("Plot"),
            htmlOutput("Text")
        )
    )
))