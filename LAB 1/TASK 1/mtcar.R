# Load the built-in dataset
data(mtcars)  # Load mtcars dataset

# View the dataset in a spreadsheet-like format (opens in RStudio Viewer)
View(mtcars)

# Check the structure of the dataset
str(mtcars)  # Displays data types, number of observations, and variables

# View summary statistics
summary(mtcars)  # Shows min, max, mean, and quartiles for each column

# Display the first 6 rows of the dataset
head(mtcars)

# Display the last 6 rows of the dataset
tail(mtcars)

# Get column names of the dataset
colnames(mtcars)

# Check the number of rows and columns
dim(mtcars)  # Returns (number of rows, number of columns)

# Check the data type of a specific column (e.g., mpg - miles per gallon)
class(mtcars$mpg)
