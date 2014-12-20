library(shiny)
library(randomForest)
library("ggplot2")

set.seed(717)
sub <- c(sample(1:50, 35), sample(51:100, 35), sample(101:150, 35))
set.seed(12)
iris.rf <- randomForest(Species ~ ., data=iris, importance=TRUE, proximity=TRUE,ntree=1000, subset=sub)
contable<-table(predict(iris.rf, iris[-sub,], type = "class"), iris[-sub, "Species"])

shinyServer(
  function(input, output) {
    output$species<-reactive({
      if(input$goButton > 0)
        paste0("Predicted Species:",
        predict(iris.rf, newdata = data.frame(Sepal.Length=input$sl,Sepal.Width=input$sw,Petal.Length=input$pl,Petal.Width=input$pw)))
      else ""
      })
    output$scatterplot <- renderPlot({
      plot(iris,col=iris$Species, main="Iris data(black=setosa, red= versicolor, green=virginica)")
    })
    output$summary <- renderPrint({
      summary(iris)
    })
    # sorted columns are colored now because CSS are attached to them
    output$table <- renderDataTable({
      iris
    }, options = list(orderClasses = TRUE))
    output$model <- renderPrint({
      iris.rf
    })
    output$modelplot <- renderPrint({
      iris.rf
    })
    output$proptable<-renderPrint({
      prop.table(contable)
    })
    output$modelplot <- renderPlot({
      varImpPlot(iris.rf)
    })
   
})