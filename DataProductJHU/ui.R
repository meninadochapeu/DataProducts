library(shiny)
library(ggplot2)
library(markdown)

dataset <- diamonds

fluidPage(theme = "bootstrap.css",
          
          
          headerPanel("DIAMONDS\n"),
          h2("Analyze diamonds by their cut, color, clarity, price, and other attributes\n"),
          h3("Jéssica Félix, june 2019, Coursera Project\n"),
          
          sidebarPanel(
              
              sliderInput('sampleSize', 'Sample Size - instructions in: ', min=1, max=nrow(dataset),
                          value=min(1000, nrow(dataset)), step=500, round=0),
              
              selectInput('x', 'X', names(dataset)),
              selectInput('y', 'Y', names(dataset), names(dataset)[[2]]),
              selectInput('color', 'Color', c('None', names(dataset))),
              
              checkboxInput('jitter', 'Jitter'),
              checkboxInput('smooth', 'Smooth'),
              
              selectInput('facet_row', 'Facet Row', c(None='.', names(dataset))),
              selectInput('facet_col', 'Facet Column', c(None='.', names(dataset)))
          ),
          
          mainPanel(
              plotOutput('plot')
          )

)