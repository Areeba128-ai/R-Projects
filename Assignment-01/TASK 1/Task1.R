# Load necessary libraries
library(dplyr)
library(caret)
library(ggplot2)
library(randomForest)

# Load dataset
data(mtcars)

# Convert `am` (transmission type) to a factor for classification
mtcars <- mtcars %>%
  mutate(am = as.factor(am))  # 0 = automatic, 1 = manual

# Split data into training and testing sets
set.seed(123)
trainIndex <- createDataPartition(mtcars$am, p = 0.8, list = FALSE)
trainData <- mtcars[trainIndex, ]
testData <- mtcars[-trainIndex, ]

# Train Logistic Regression Model
log_model <- glm(am ~ ., data = trainData, family = binomial)

# Train Random Forest Model
rf_model <- randomForest(am ~ ., data = trainData, ntree = 100)

# Make predictions
log_predictions <- predict(log_model, testData, type = "response")
rf_predictions <- predict(rf_model, testData)

# Convert logistic regression predictions to class labels
log_class_pred <- ifelse(log_predictions > 0.5, 1, 0)
log_class_pred <- as.factor(log_class_pred)

# Evaluate models
log_cm <- confusionMatrix(log_class_pred, testData$am)
rf_cm <- confusionMatrix(rf_predictions, testData$am)

# Print confusion matrices
print("Logistic Regression Confusion Matrix:")
print(log_cm)
print("Random Forest Confusion Matrix:")
print(rf_cm)

# Visualize results
ggplot(mtcars, aes(x = mpg, y = hp, color = am)) +
  geom_point(size = 3) +
  labs(title = "Car Transmission Type (Manual vs. Automatic)",
       x = "Miles Per Gallon (mpg)", y = "Horsepower (hp)") +
  theme_minimal()
