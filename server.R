#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(datasets)
data("diamonds")
library(dplyr)
library(ggplot2)
library(cowplot)

## Preprocessing 
diamonds <- diamonds[(diamonds$carat < quantile(diamonds$carat, probs = 0.99)), ]

# linear model
model <- lm(price ~ ., diamonds)



shinyServer(function(input, output) {

    output$Title1 <- renderText({
        paste0(strong("Distribution of numeric variables"))
    })
    
    output$Plot <- renderPlot({
        
        g1 = ggplot(data=diamonds) + geom_histogram(aes(price), bins=50, fill="coral1", color="black")
        g2 = ggplot(data=diamonds) + geom_histogram(aes(carat), bins=50, fill="coral1", color="black")
        g3 = ggplot(data=diamonds) + geom_histogram(aes(depth), bins=50, fill="coral1", color="black")
        g4 = ggplot(data=diamonds) + geom_histogram(aes(x), bins=50, fill="coral1", color="black")
        g5 = ggplot(data=diamonds) + geom_histogram(aes(y), bins=50, fill="coral1", color="black")
        g6 = ggplot(data=diamonds) + geom_histogram(aes(z), bins=50, fill="coral1", color="black")
        
        plot_grid(g1, g2, g3, g4, g5, g6)
    })
    
    output$Text <- renderText({
        
        df <- data.frame(carat=input$carat, cut = input$cut, color = input$color, 
                         clarity = input$clarity, 
                         depth=input$depth, table = input$table, 
                         x = as.numeric(input$x), y = as.numeric(input$y), z = as.numeric(input$z))
        print(df)
        
        ch <- predict(model, newdata=df)
        paste0("The predicted price for the given set of values will be around $", strong(round(ch, digits = 2)))
    })
})
