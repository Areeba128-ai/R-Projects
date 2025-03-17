# Install caret and dependencies (Uncomment if not installed)
install.packages("caret")
install.packages("e1071")  # Required for classification models

# Load the library
library(caret)

# Load the built-in iris dataset
data(iris)

# Split the dataset into training (80%) and testing (20%)
set.seed(123)  # For reproducibility
index <- createDataPartition(iris$Species, p=0.8, list=FALSE)
train_data <- iris[index,]
test_data <- iris[-index,]

# Train a simple Decision Tree model
model <- train(Species ~ ., data=train_data, method="rpart")

# Make predictions on the test data
predictions <- predict(model, test_data)

# Evaluate accuracy
conf_matrix <- confusionMatrix(predictions, test_data$Species)
print(conf_matrix)
