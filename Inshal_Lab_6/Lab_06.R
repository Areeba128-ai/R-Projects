# Load necessary libraries
library(dplyr)     # For data manipulation
library(DMwR2)      # For SMOTE
library(caret)     # For machine learning utilities like train() and cross-validation
library(rpart)     # For Decision Tree model
library(rpart.plot) # For plotting Decision Trees
library(smotefamily)


# Set seed for reproducibility
set.seed(123)

### Core Task ###
# Purpose: Balance the iris dataset by artificially oversampling minority classes

# Load the iris dataset
data(iris)

# Remove 80% of the 'setosa' class
# filter() used to selectively remove rows
setosa_rows <- iris %>% filter(Species == "setosa")
other_rows <- iris %>% filter(Species != "setosa")

# sample() used to randomly select 20% of setosa rows
setosa_sample <- setosa_rows %>% sample_frac(0.2)

# Combine 20% setosa with other classes
iris_modified <- bind_rows(setosa_sample, other_rows)

# Check class distribution
table(iris_modified$Species)

# Oversample the 'setosa' class manually
# Purpose: To balance the dataset by replicating minority class instances

# Oversampling by replicating existing 'setosa' samples
oversampled_setosa <- setosa_sample %>% slice(rep(1:n(), each=5))  # replicate each sample 5 times

# Combine oversampled setosa with other classes
iris_balanced <- bind_rows(oversampled_setosa, other_rows)

# Check new class distribution after oversampling
table(iris_balanced$Species)

### Optional Task: Apply SMOTE and Compare Results ###

# Step 1: Before SMOTE class distribution
library(ggplot2)

ggplot(iris_balanced, aes(x=Species, fill=Species)) +
  geom_bar() +
  ggtitle("Class Distribution Before SMOTE") +
  theme_minimal()

# Step 2: Apply SMOTE
iris_smote <- SMOTE(X=iris_balanced[,-5], target=iris_balanced$Species, K=5)

# Step 3: Extract SMOTE data
iris_smote_data <- iris_smote$data
colnames(iris_smote_data)[ncol(iris_smote_data)] <- "Species"
iris_smote_data <- as.data.frame(iris_smote_data)

# Step 4: After SMOTE class distribution
ggplot(iris_smote_data, aes(x=Species, fill=Species)) +
  geom_bar() +
  ggtitle("Class Distribution After SMOTE") +
  theme_minimal()

# Step 5: Train Decision Tree on original (imbalanced) data
dt_model_before <- train(Species~., 
                         data=iris_balanced,
                         method="rpart",
                         trControl=trainControl(method="cv", number=5))

# Step 6: Train Decision Tree on SMOTE data
dt_model_after <- train(Species~., 
                        data=iris_smote_data,
                        method="rpart",
                        trControl=trainControl(method="cv", number=5))

# Step 7: Compare Accuracy
acc_before <- max(dt_model_before$results$Accuracy)
acc_after <- max(dt_model_after$results$Accuracy)

comparison <- data.frame(
  Dataset=c("Before SMOTE", "After SMOTE"),
  Accuracy=c(acc_before, acc_after)
)

print(comparison)

# Step 8: Plot Comparison
ggplot(comparison, aes(x=Dataset, y=Accuracy, fill=Dataset)) +
  geom_bar(stat="identity") +
  ylim(0,1) +
  ggtitle("Accuracy Before vs After SMOTE") +
  theme_minimal()



### Advanced Task: Hyperparameter tuning for Decision Tree ###

# Step 1: Apply SMOTE (already done above)
iris_smote <- SMOTE(X=iris_balanced[,-5], target=iris_balanced$Species, K=5)

# Step 2: Extract the balanced data
iris_smote_data <- iris_smote$data

# Step 3: Rename the target column
colnames(iris_smote_data)[ncol(iris_smote_data)] <- "Species"

# Step 4: Convert to proper data frame
iris_smote_data <- as.data.frame(iris_smote_data)

# Step 5: Check class balance
table(iris_smote_data$Species)
# Expected output:
# setosa      versicolor      virginica
#   100             50              50

# Step 6: Set a grid of hyperparameters (cp values to try)
tune_grid <- expand.grid(cp=seq(0.001, 0.05, by=0.005))

# Step 7: Train Decision Tree with cross-validation
dt_model <- train(Species~., 
                  data=iris_smote_data, 
                  method="rpart", 
                  trControl=trainControl(method="cv", number=5),  # 5-fold cross-validation
                  tuneGrid=tune_grid)

# Step 8: Display the best cp value
dt_model$bestTune

# Step 9: Plot the final Decision Tree
rpart.plot(dt_model$finalModel)
