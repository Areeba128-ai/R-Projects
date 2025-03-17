# Install dplyr (Uncomment if not installed)
# install.packages("dplyr")

# Load the library
library(dplyr)

# Load the built-in iris dataset
data(iris)

# Filter for 'setosa' species and arrange by Sepal.Length
filtered_iris <- iris %>%
  filter(Species == "setosa") %>%
  arrange(Sepal.Length)

# Display the filtered dataset
print(filtered_iris)
