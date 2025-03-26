# Load necessary libraries
library(readr)

# Read dataset (Ensure the CSV file is in your working directory)
happiness_data <- read_csv("World_Happiness_Report_2024.csv")

# Show first 5 rows
head(happiness_data, 5)

# Get summary of dataset
summary(happiness_data)


# Check for missing values
colSums(is.na(happiness_data))

# Save the cleaned dataset as a CSV file
write_csv(happiness_data, "cleaned_happiness.csv")
