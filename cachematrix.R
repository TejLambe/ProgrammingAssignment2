## Matrix inversion is usually a costly computation and there may be some benefit to caching 
## the inverse of a matrix rather than computing it repeatedly. 
## This assignment is to write a pair of functions that cache the inverse of a matrix.

## Function makeCacheMatrix()
## This function creates a special "matrix" object that can cache its inverse.
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of inverse of the matrix
## 4. get the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  inv_matrix <- NULL
  set <- function(y) {
    x <<- y
    inv_matrix <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv_matrix <<- inverse
  getinverse <- function() inv_matrix
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)

}


## Function cacheSolve()
## This function returns a matrix that is the inverse of 'x'. It first checks if
## the inverse has already been computed. If so, it gets the result and skips the
## computation. If not, it computes the inverse, sets the value in the cache via the
## setinverse function.
## This function assumes that the matrix is always invertible.

cacheSolve <- function(x, ...) {
  inv_matrix <- x$getinverse()
  if(!is.null(inv_matrix)) {
    message("getting cached inverted matrix data")
    return(inv_matrix)
  }
  matrix_data <- x$get()
  inv_matrix <- solve(matrix_data)
  x$setinverse(inv_matrix)
  inv_matrix
}
