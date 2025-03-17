# Install ggplot2 (Uncomment if not installed)
# install.packages("ggplot2")

# Load the library
library(ggplot2)

# Load the built-in mtcars dataset
data(mtcars)

# Create a scatter plot: Weight vs. Miles per Gallon
ggplot(mtcars, aes(x=wt, y=mpg)) +
  geom_point(color="blue") +
  labs(title="Scatterplot of Weight vs. MPG",
       x="Weight (1000 lbs)",
       y="Miles per Gallon")
