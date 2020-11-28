## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function - 
## builds a set of functions and returns the functions within a list to the parent environment

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
  inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) {
    inv <<- inverse
    }
  getinverse <- function() {
    inv
    }
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function
## this function checks to see whether the inverse desired is already in cache. if it is, it returns the cached inverse matrix. if not, it calculates the inverse 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inv <- x$getinverse()
    if(!is.null(inv)) {
      message("getting cached data")
      return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinverse(inv)
    inv
  }

