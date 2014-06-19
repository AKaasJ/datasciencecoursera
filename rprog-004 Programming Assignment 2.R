#rprog-004 Programming Assignment 2
## [This R file contains two functions. makeCacheMatrix and cacheSolve ]

makeCacheMatrix <- function(x = matrix()) {
  ## Creates a list of functions related to matrix x: set(), get(), setinvert() and getinvert()
  i <- NULL #i is the inverted cached matrix is NULL at the beginning
  set <- function(y) { #set function allows for changing x
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
