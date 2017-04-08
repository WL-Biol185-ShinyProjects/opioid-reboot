library(dplyr)

plotHandler <- function(input) {
  
  # draw the histogram with the specified number of bins
  hist(iris[iris$Species == input$species, ]$Sepal.Length, col = 'darkgray', border = 'white')
  
}