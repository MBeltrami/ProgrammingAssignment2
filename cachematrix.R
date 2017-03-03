## Below we have two functions used to store a matrix and its inverse.
## The purpose of these functions is to avoid unnecessary recomputation of the computational expensive operation of inverting a matrix.

## The makeCache Matrix function creates a special matrix.
## It actually returns a list of 4 functions that are used to get/set the matrix we want to invert and to get/set its inverse.

makeCacheMatrix <- function(x = matrix()) {
        Inv <- NULL
        set <- function(y){
                x <<- y
                Inv <<- NULL
        }
        get <- function(){
                x        
        }
        setinv <- function(Inverse){
                Inv <<- Inverse
        }
        getinv <- function(){
                Inv
        }
        list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## The cacheSolve function checks if the inverse of the matrix has already been computed and, if so, returns the stored inverse matrix, else it computes the inverse of the given matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        Inv <- x$getinv()
        
        if (!is.null(Inv)){
                message("Getting inverse matrix from cache")
                return(Inv)
        }
        
        Inv <- solve(x$get())
        x$setinv(Inverse = Inv)
        Inv
}

