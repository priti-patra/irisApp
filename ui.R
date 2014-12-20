library(shiny)
shinyUI(navbarPage("Machine learning of Iris dataset!",
                   tabPanel("Predict species",
                            
                            sidebarLayout(
                              sidebarPanel(
                                h3("select values using sliders for following fields(units:in cm) to predict species :"),
                                sliderInput('sl', "Sepal Length", value=0.1, min = 0.1, max = 10, step=0.1),
                                sliderInput('sw', "Sepal Width", value=0.1 , min = 0.1, max = 10, step=0.1),
                                sliderInput('pl', "Petal Length", value=0.1 , min = 0.1, max = 10, step=0.1),
                                sliderInput('pw', "Petal Width", value=0.1 , min = 0.1, max = 10,step=0.1),
                                br(),
                                actionButton("goButton", "Predict!")
                             ),
                                
                              mainPanel(
                                verbatimTextOutput("species")
                              )
                            )
                   ),
                   tabPanel("Iris Data",
                            h3("Iris Dataset"),
                            br(),
                            h4('Click the column header to sort a column.'),
                            dataTableOutput("table")
                            
                   ),
                   tabPanel("Analysis",
                            h3("Summary of Iris dataset  :"),
                            verbatimTextOutput("summary"),
                            br(),
                            h3("Following Scatterplot shows different species have characterstics length and width of petals and sepals"),
                            plotOutput("scatterplot")
                   ),
                   tabPanel("Prediction Model",
                            h3("Model :"),
                            verbatimTextOutput("model"),
                            br(),
                            h3("Property table of model prediction for out of sample data"),
                            verbatimTextOutput("proptable"),            
                            br(),
                            h3("Following Plot showing importance of variables of Iris dataset for random forest model"),
                            
                            plotOutput("modelplot")
                   ),
                   tabPanel("Documentation",
                             fluidRow(
                                       column(6,
                                                includeMarkdown("helpfile.md")
                                     )
                           )
                  )
                              
                   
))
