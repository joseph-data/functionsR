##---------- Functions ---------##
# how to define and call a function
# parts of a funnction
# calling functions - rules for ordering of multiple arguments
# variable scoping

# Defining a Function
square <- function(x){
  ## square the argument
  return(x^2)
}

square(9)


# function as objects
fun <- square
fun(4)

## Parts of a function
formals(square)
body(square)

## environment
environment(square)

## Attributes
attributes(square)$srcref

# custom attributes
attr(square, "type") <- "polynomial"

## multiple arguments and default values
center1 <- function (x, fun = "mean", p = 0.5){
  if(fun == "mean"){
    x0 <- x - mean(x)
  } else if(fun == "median"){
    x0 <- x - median(x)
  }else if(fun == "quantile"){
    x0 <- x-quantile(x, probs = p)
  }else{
    stop("unrecognized function name")
  }
  return(x0)
}

y = (1:9)^2
mean(y)
center1(y, fun ="mean")
center1(y, fun ="median")
center1(y, fun = "quantile", p = 0.5)


## calling a function within a function

center3 <- function(x, fun = mean, ...){
  x0 <- x - fun(x, ...)
  return(x0)
}

center3(y, median)
center3(y, quantile, probs = 0.5)

## do.call on a string function
#?do.call()
do.call("mean", list(y))
do.call("quantile", list(y, probs = 0.25))

center4 <- function(x, fun = "mean", ...){
  print(list(x, ...))
  x0 <- x - do.call(fun, list(x, ...))
  return(x0)
}

center4(y)
center4(y, "median")
center4(y, "quantile", probs = 0.25)
