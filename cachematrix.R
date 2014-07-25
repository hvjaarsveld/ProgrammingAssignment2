## These 2 functions implement the solution to R Rpogramming Assignment 2

## makeCacheMatrix stores a matrix and be used to return the matrix or its inverse
## Example usage: m <- makeCacheMatrix(matrix(c(1,2,3,4),2,2))

makeCacheMatrix <- function(x = matrix()) {
  inverse_m <- NULL
  set <- function(y) {
    x <<- y
    inverse_m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) inverse_m <<- solve
  getinverse <- function() inverse_m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse) 
}


## cacheSolve takes a datastructure created by makeCacheMatrix and returns it inverse
## Example usage: cacheSolve(m)

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}
