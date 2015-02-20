## The functions below work together for save timing in computing 
##the function solve; they're useful when you need to run 
##'solve' more than once for the same matrix. 

## First of all, you need run this function in your matrix and assign 
##it to a variable. It will store the matrix - "x$get()" - and when you 
##run the second function will store the cache in "s".

makeCacheMatrix <- function(x = matrix()) {
			s <- NULL
				set <- function(y) {
					x <<- y
					s <<- NULL
					}
				get <- function() x
				setS <- function(solved) s <<- solved
				getS <- function() s
			list(set = set, get = get, setS = setS, getS = getS) 	
}


##...after you will run the function below with the variable defined 
##above. So when you run this function again and so on, 
##will save timing retrieving the cache rather than recomputing "solve".

cacheSolve <- function(x, ...) {
        	s <- x$getS()
			if(!is.null(s)) {
				message("getting cached data!")
				return(s)
				}
		data <- x$get()
		s <- solve(data, ...)
		x$setS(s)
		s
}