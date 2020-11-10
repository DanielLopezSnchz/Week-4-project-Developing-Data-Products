library(shiny)
library(ggplot2)
shinyServer(function(input, output) {
    mtcars$cyl <- factor(mtcars$cyl)
    mtcars$am <- factor(mtcars$am)
    model1 <- lm(formula = mpg~cyl+hp+wt+am, data = mtcars)

    model1pred <- reactive({
        cylInput <- input$selectCyl
        AmInput <- input$selectAm
        hpInput <- input$sliderHp
        wtInput <- input$sliderWt
        predict(object = model1, newdata = data.frame(cyl=cylInput,
                                                      hp = hpInput,
                                                      wt = wtInput,
                                                      am = AmInput))
    })
    output$plot1 <- renderPlot({
        cylInput <- input$selectCyl
        AmInput <- input$selectAm
        hpInput <- input$sliderHp
        wtInput <- input$sliderWt
        g1 <- ggplot(data = mtcars, aes(x = wt, y = mpg))+
            geom_point(aes(size=1.5))
        if(input$showCylColor){
            g1 <- ggplot(data = mtcars, aes(x = wt, y = mpg, colour=cyl))+
                geom_point(aes(size=1.5))
        }
        g1
    })
    output$pred1 <- renderText({
        model1pred()
    })

})
