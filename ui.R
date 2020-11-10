library(shiny)

shinyUI(fluidPage(
    titlePanel("Predicting Miles per Gallon"),
    sidebarLayout(
        sidebarPanel(
            selectInput(inputId = "selectCyl", label = "Select number of cylinders", choices = list("4", "6","8")),
            selectInput(inputId = "selectAm", label = "Select transmission type (0 = automatic, 1 = manual)", choices = list("0", "1")),
            sliderInput(inputId = "sliderHp", label = "What is the gross horsepower?",min = 52, max = 335,value = 123),
            sliderInput(inputId = "sliderWt", label = "Select Weight (1000 lbs)",min = 1, max = 6,value = 3.5),
            checkboxInput(inputId = "showCylColor", label = "Color by number of cylinders", value = FALSE),
            submitButton("GO!")
        ),
        mainPanel(
            plotOutput(outputId = "plot1"),
            h3("Predicted Miles per gallon"),
            textOutput(outputId = "pred1"),
        )
    )
))
