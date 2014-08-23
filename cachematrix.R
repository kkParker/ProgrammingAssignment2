## This function creates a special "matrix" object that
## can cache its inverse.

## This function is designed to 
makeCacheMatrix <- function(x = matrix()) {

}

## This function computes the inverse of the special 
## "matrix" returned by makeCacheMatrix above. If the
## inverse has already been calculated (and the matrix 
## has not changed), then the cachesolve should retrieve
## the inverse from the cache.

## This is accomplished by using the
## solve function in R. 
## For example, if X is a square invertible matrix, 
## then solve(X) returns its inverse.  
## For this function ## it is assumed that the matrix
## is always invertible.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
