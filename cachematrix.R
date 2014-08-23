## This function creates a special "matrix" object that
## can cache its inverse.

## This is accomplished by using the solve function in R. 
## For example, if X is a square invertible matrix, 
## then solve(X) returns its inverse.  

## This code defines the functions set, get, setinverse, and get inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) { m <<- solve } # this is called by cacheinverse() during the first cacheinnverse()
                                              #  access and it will store the value using superassignment
  getinverse <- function() { m }
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## This function computes the inverse of the special 
## "matrix" returned by makeCacheMatrix above. If the
## inverse has already been calculated (and the matrix 
## has not changed), then the cachesolve should retrieve
## the inverse from the cache.

## For this function ## it is assumed that the matrix
## is always invertible.

## This function either does the inverse calculation
## or returns a message that it is 'getting cached data'

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()  ## if it has already been calculated it won't be null
  if(!is.null(m)) {
    message("getting cached data") 
    return(m)  ##exit function returning the getinverse cached value
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}


## testing output
## > test<-makeCacheMatrix(matrix(1:4, 2, 2))
## > test$get()
##      [,1] [,2]
## [1,]    1    3
## [2,]    2    4
## > cacheSolve(test)
##       [,1] [,2]
## [1,]   -2  1.5
## [2,]    1 -0.5
## > cacheSolve(test)
## getting cached data
##       [,1] [,2]
## [1,]   -2  1.5
## [2,]    1 -0.5
