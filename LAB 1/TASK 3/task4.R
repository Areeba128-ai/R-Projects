# Install data.table (Uncomment if not installed)
# install.packages("data.table")

# Load the library
library(data.table)

# Create a data table
dt <- data.table(Name = c("Alice", "Bob", "Charlie", "Alice", "Bob"),
                 Subject = c("Math", "Math", "Science", "Science", "Math"),
                 Score = c(90, 85, 95, 88, 89))

# View the data table
print(dt)

# Aggregate: Calculate the average score per student
avg_scores <- dt[, .(Average_Score = mean(Score)), by=Name]
print(avg_scores)

# Aggregate: Calculate the average score per subject
avg_subject <- dt[, .(Average_Score = mean(Score)), by=Subject]
print(avg_subject)
