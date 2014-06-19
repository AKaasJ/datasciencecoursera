#rprog-004 Programming Assignment 2
## [This R file contains two functions. makeCacheMatrix and cacheSolve ]
## makeCacheMatrix creates a list of functions related to matrix x: set(), get(), setinvert() and getinvert()
## cacheSolve returns a matrix that is the inverse of 'x' unless an inverted matrix has already been computed in that case this matrix is retured
## the script was tested using a generated invertable matrix and runnign cachematrix twice to test that it returned a cached result the second time

#newmatrix <- matrix(c(0,2,2,0),2,2)
#cachedmatrix <- makeCacheMatrix(newmatrix)
#cacheSolve(cachedmatrix)
#cacheSolve(cachedmatrix) #should return the string "Getting cached data" and then the inverted matrix


makeCacheMatrix <- function(x = matrix()) {
  ## Creates a list of functions related to matrix x: set(), get(), setinvert() and getinvert()
  i <- NULL #i is the inverted cached matrix is NULL at the beginning
  set <- function(y) { #set function allows for changing the matrix x
    x <<- y
    i <<- NULL #resets i to NULL
  }
  get <- function() x #get function returns orignal matrix (x)
  setinvert <- function(invert) i <<- invert #setinvert sets inverted matrix(i) to a specific value (called in "cacheSolve" function)
  getinvert <- function() i #getinvert returns i
  list(set = set, get = get, #creates list containing functions
       setinvert = setinvert,
       getinvert = getinvert)
  
  
}

cacheSolve <- function(x, ...) {
  ## Returns a matrix that is the inverse of 'x'
  i <- x$getinvert()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  } #if getinvert returns NULL this will caclulate the invert matrix of x
  data <- x$get()
  i <- solve(data, ...)
  x$setinvert(i)#using setinvert the function will "input" the inverted matrix into x
  i 
}
