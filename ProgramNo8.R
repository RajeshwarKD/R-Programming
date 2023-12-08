# Creating two vector as a matrixA & matrixB
MatrixA <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)
MatrixB <- c(9, 8, 7, 6, 5, 4, 3, 2, 1)

# Creating First matrix A
myMatrixA <- matrix(MatrixA, nrow = 3, ncol = 3)
cat("Matrix A:")
print(myMatrixA)

# Creating Second matrix B
myMatrixB <- matrix(MatrixB, nrow = 3, ncol = 3)
cat("Matrix B:")
print(myMatrixB)

# Transpose of matrix A
transposeA <- t(myMatrixA)
cat("Transpose of Matrix A:")
print(transposeA)

# Addition of matrices A and B
matrixC_Addition <- myMatrixA + myMatrixB
cat("Result of Addition:")
print(matrixC_Addition)

# Subtraction of matrices A and B
matrixC_Subtraction <- myMatrixA - myMatrixB
cat("Result of Subtraction:")
print(matrixC_Subtraction)