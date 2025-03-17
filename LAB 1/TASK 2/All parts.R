# Practicing Built-in Functions in R

# 1. Calculate basic descriptive statistics (mean, median, mode)
numbers <- c(5, 8, 3, 8, 9, 5, 8, 3, 5)  # Example numeric vector
mean_value <- mean(numbers)  # Calculate mean
median_value <- median(numbers)  # Calculate median

# Function to calculate mode
get_mode <- function(x){
  unique_x <- unique(x)
  freq <- tabulate(match(x, unique_x))
  unique_x[freq == max(freq)]
}
mode_value <- get_mode(numbers)  # Calculate mode

# Print results
cat("Mean:", mean_value, "\n")
cat("Median:", median_value, "\n")
cat("Mode:", mode_value, "\n")

# 2. Generate a sequence from 1 to 100 and sum all even numbers
num_seq <- 1:100  # Generate numbers from 1 to 100
even_numbers <- num_seq[num_seq %% 2 == 0]  # Filter even numbers
sum_even <- sum(even_numbers)  # Sum of even numbers

cat("Sum of even numbers from 1 to 100:", sum_even, "\n")

# 3. Use paste() to concatenate multiple strings with a separator
str1 <- "Hello"
str2 <- "World"
str3 <- "R is fun!"
concatenated <- paste(str1, str2, str3, sep = " - ")  # Concatenate with a separator

cat("Concatenated String:", concatenated, "\n")

# 4. Create a matrix and perform operations
matrix_A <- matrix(c(2, 4, 3, 1, 5, 7, 6, 8, 9), nrow = 3, byrow = TRUE)  # 3x3 matrix
cat("Original Matrix:\n")
print(matrix_A)

# Transpose of the matrix
transposed_matrix <- t(matrix_A)
cat("Transposed Matrix:\n")
print(transposed_matrix)

# Determinant of the matrix
det_matrix <- det(matrix_A)
cat("Determinant of the Matrix:", det_matrix, "\n")

# Inverse of the matrix (if determinant is not zero)
if(det_matrix != 0){
  inverse_matrix <- solve(matrix_A)
  cat("Inverse of the Matrix:\n")
  print(inverse_matrix)
} else {
  cat("Matrix is singular, no inverse exists.\n")
}
