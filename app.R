# Sam Hawke
# BIOS 611
# 
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

tv <- read.csv("derived_data/tv.csv")
tv$one_season <- ifelse(tv$num_seasons == 1, 1, 0)
tv$cast_size <- sapply(strsplit(as.character(tv$cast), split = ","), length)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("TV Shows by Number of Seasons"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("bins1",
                     "Number of bins for # of seasons:",
                     min = 2,
                     max = 20,
                     value = 8),
         sliderInput("bins2",
                     "Number of bins for cast size:",
                     min = 2, max = 12, value = 6),
         sliderInput("year",
                     "Release year:",
                     min = 1979,
                     max = 2017,
                     value = 1999)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot"),
         # plotOutput("scatter"),
         plotOutput("density"),
         plotOutput("density2")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
      x    <- tv$num_seasons
      bins <- seq(min(x), max(x), length.out = input$bins1 + 1)
      
      # draw the histogram with the specified number of bins
      hist(x, breaks = bins, col = 'purple', border = 'white',
           main = "Histogram of Number of Seasons of TV",
           xlab = "Number of Seasons",
           ylab = "Frequency")
   })
   
   output$scatter <- renderPlot({
     # generate algo based on input from ui
     ggplot(data = tv, aes(x = as.numeric(release_year), 
                           y = as.numeric(cast_size), 
                           color = as.factor(one_season))) +
       geom_point() +
       labs(title = "Scatterplot of Cast Size by Release Year",
            x = "Release Year",
            y = "Cast Size",
            color = "One Season\
(vs more than one)")
   })
   
   output$density <- renderPlot({
     # generate bins based on input$bins from ui.R
     x1 <- tv %>% 
       filter(abs(release_year - input$year) <= 3 & one_season == 1) 
     x1 <- x1$cast_size
     bins <- seq(min(as.numeric(x1)), 
                max(as.numeric(x1)), 
                length.out = input$bins2 + 1)
     
     # draw the histogram with the specified number of bins
     hist(x1, breaks = bins, col = 'orange', border = 'white',
          main = paste("Histogram of Cast Size for Shows Lasting 1 Season, Year", as.character(input$year)),
          xlab = "Cast Size",
          ylab = "Frequency")
    
   })
   
   output$density2 <- renderPlot({
     x2 <- tv %>% 
       filter(abs(release_year - input$year) <= 3 & one_season == 0) 
     x2 <- x2$cast_size
     bins <- seq(min(as.numeric(x2)), 
                 max(as.numeric(x2)), 
                 length.out = input$bins2 + 1)
     
     # draw the histogram with the specified number of bins
     
     hist(x2, breaks = bins , col = 'green', border = 'white',
          main = paste("Histogram of Cast Size for Shows Lasting > 1 Season, Year", as.character(input$year)),
          xlab = "Cast Size",
          ylab = "Frequency")
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

