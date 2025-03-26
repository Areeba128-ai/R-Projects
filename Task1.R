

library(readr)

data <- read_csv("world-happiness-report-2024.csv")

head(data, 5)


summary(data)


colSums(is.na(data))


# Remove rows with missing values (if any)
cleaned_data <- na.omit(data)

# Save to a new CSV file
write_csv(cleaned_data, "cleaned_happiness.csv")


write_csv(data, "cleaned_happiness.csv")

