## Put comments here that give an overall description of what your
## functions do

## Following code sets and gets the value of inverse matrix.

makeCacheMatrix <- function(x = matrix()) {
   invm <- NULL
        set <- function(y) { #set value of matrix
                x <<- y
                invm <<- NULL
        }
        get <- function() x #get the value of matrix
        setInverse <- function(inverse) invm <<- inverse  #set value of inverse matrix
        getInverse <- function() invm #get value of the inverse matrix
        list(set = set,
             get = get, 
             setInverse = setInverse,
             getInverse = getInverse)
}


##The following code returns the inverse matrix, if not cached, it calculates it else uses the one in cache. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
        invm <- x$getInverse()
        if (!is.null(invm)) {
                message("getting cached data")
                return(invm) #Return cached inverse matrix, saves time and resources
        }
        mat <- x$get()
        invm <- solve(mat, ...)  #calculate inverse matrix if not found in cache.
        x$setInverse(invm)
        invm
}
