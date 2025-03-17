# 1. Calculate basic descriptive statistics (mean, median, mode)

# Create a numeric vector
numbers <- c(10, 20, 30, 10, 40, 50, 10, 60, 70)

# Mean (Average)
mean_value <- mean(numbers)
print(paste("Mean:", mean_value))

# Median (Middle value)
median_value <- median(numbers)
print(paste("Median:", median_value))

# Mode (Most frequent value)
mode_function <- function(x){
  uniq_vals <- unique(x)
  return(uniq_vals[which.max(tabulate(match(x, uniq_vals)))])
}
mode_value <- mode_function(numbers)
print(paste("Mode:", mode_value))


# 2. Generate a sequence and find the sum of even numbers

# Create a sequence from 1 to 100
seq_nums <- 1:100

# Filter even numbers and calculate sum
sum_even <- sum(seq_nums[seq_nums %% 2 == 0])
print(paste("Sum of even numbers from 1 to 100:", sum_even))


# 3. Use paste() function to concatenate strings

str1 <- "Hello"
str2 <- "World"
str3 <- "R Programming"
concatenated <- paste(str1, str2, str3, sep = " - ")
print(concatenated)


# 4. Create a matrix and perform operations

# Define a 3x3 matrix
matrix_A <- matrix(c(2, 3, 1, 4, 5, 6, 7, 8, 9), nrow = 3, byrow = TRUE)
print("Matrix A:")
print(matrix_A)

# Transpose of the matrix
transpose_A <- t(matrix_A)
print("Transpose of A:")
print(transpose_A)

# Determinant of the matrix
det_A <- det(matrix_A)
print(paste("Determinant of A:", det_A))

# Inverse of the matrix (only if determinant is not zero)
if(det_A != 0){
  inverse_A <- solve(matrix_A)
  print("Inverse of A:")
  print(inverse_A)
}else{
  print("Matrix A is singular and cannot be inverted.")
}
