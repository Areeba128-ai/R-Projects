# Install tidyr (Uncomment if not installed)
# install.packages("tidyr")

# Load the library
library(tidyr)

# Create a sample dataset in wide format
wide_data <- data.frame(
  Name = c("Alice", "Bob", "Charlie"),
  Math = c(90, 85, 88),
  Science = c(92, 89, 95)
)

# Convert from wide to long format
long_data <- pivot_longer(wide_data, cols = c(Math, Science), names_to = "Subject", values_to = "Score")
print(long_data)

# Convert back from long to wide format
wide_again <- pivot_wider(long_data, names_from = "Subject", values_from = "Score")
print(wide_again)
