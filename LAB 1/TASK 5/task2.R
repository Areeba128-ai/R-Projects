# Load required libraries
library(plotly)

# Create a basic scatter plot
p <- plot_ly(data = mtcars, 
             x = ~wt, 
             y = ~mpg, 
             type = "scatter", 
             mode = "markers",
             marker = list(size = 10, color = "blue")) %>%
  layout(title = "Interactive Scatterplot of Weight vs MPG",
         xaxis = list(title = "Car Weight"),
         yaxis = list(title = "Miles per Gallon"))

# Display the plot
p
