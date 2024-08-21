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

