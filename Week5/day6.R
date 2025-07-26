# Week 5 – Day 6: R – Functional Programming with Closures & Higher-Order Functions

# R is a functional language at its core, meaning:
# - Functions are first-class citizens
# - You can pass functions as arguments
# - You can return functions from other functions
# - Variables can be captured in lexical closures ie functions that “remember” the environment where they were created
# - You can build elegant pipelines using function chaining


# First-class functions - Function as value 
#     ex: f <- function(x) x + 1
# Closures - Functions that remember their environment
#     ex: make_counter() returning an internal counter function
# Higher-order functions - Functions that take or return functions 
#     ex: lapply(), sapply(), Map(), custom funcs
# Function factories - Functions that return other functions
#     ex: make_multiplier <- function(n) function(x) x * n
# Anonymous functions - 
#     ex1: function(x) x * 2 inside sapply() 
#     ex2: lapply(vec, function(x) x + 1)
# Function chaining - 
    # ex1: %>% from library(magrittr)
    # ex2: purrr::map() chains


# Closure & Function Factory
make_power <- function(n) {
  function(x) x ^ n
}

square <- make_power(2)
cube <- make_power(3)

square(4)  # → 16
cube(2)    # → 8


# Higher-order: functions that take or return functions
apply_twice <- function(f, x) {
  f(f(x))
}

double <- function(x) x * 2
apply_twice(double, 5)  # 20

# Function returning a function (Closure)
make_multiplier <- function(n) {
  function(x) x * n
}

times3 <- make_multiplier(3)
times3(10)  # 30

# Function that keeps state (Closure)
make_counter <- function() {
  count <- 0
  function() {
    count <<- count + 1
    count
  }
}

counter <- make_counter()
counter()  # 1
counter()  # 2

# Using lapply (higher-order built-in)
nums <- 1:5
squared <- lapply(nums, function(x) x^2)
unlist(squared)  # 1 4 9 16 25


# Function double(x) multiplies a number by 2.
double <- function(x) {
  x * 2
}


# Higher-order function apply_twice(f, x) applies function f twice to x.
apply_twice <- function(f, x) {
  f(f(x))
}

# Function factory make_multiplier(n) returns a function that multiplies input by n.
make_multiplier <- function(n) {
  function(x) x * n
}

times5 <- make_multiplier(5)
times5(3)  # 15

# Closure Counter make_counter() returns a function which increments and remembers a count.
make_counter <- function() {
  count <- 0
  function() {
    count <<- count + 1
    count
  }
}

counter <- make_counter()
counter()  # 1
counter()  # 2


# Custom Map Function my_map(f, vec) returns a new vector with f applied to each element.
my_map <- function(f, vec) {
  result <- vector("list", length(vec))
  for (i in seq_along(vec)) {
    result[[i]] <- f(vec[[i]])
  }
  unlist(result)
}

my_map(function(x) x^2, 1:4)  # 1 4 9 16



# Make Memory Printer make_logger(msg) returns a function which prints msg when called
make_logger <- function(msg) {
  function() print(msg)
}

log_hello <- make_logger("Hello world!")
log_hello()  # "Hello world!"

# EXERCISES


# Exercise 1 – Function Factory
# Create a function make_adder(n) that returns a function which adds n to its input.
make_adder <- function(n) {
    function(x) x + n
}

doubles <- make_adder(2)
doubles(2)

# Exercise 2 – Closure Capture
# Write a function that builds a list of functions
# each capturing a different loop variable (e.g., [[1]](x) → x + 1, [[2]](x) → x + 2, …).
make_adders <- function(n) {
  lapply(1:n, function(i) {
    function(x) x + i
  })
}

adders <- make_adders(3)
adders   # → 11
adders   # → 12
adders   # → 13


# ANOTHER OPTION:
    # make_adders <- function(n) {
    #   funcs <- list()
    #   for (i in 1:n) {
    #     funcs[[i]] <- (function(j) {
    #       function(x) x + j
    #     })(i)  # <- immediately invoke with i to capture it
    #   }
    #   return(funcs)
    # }

# 🧠 Why (function(j) {...})(i)?
# This is a function factory inside the loop, 
# immediately called with the current i. 
# It freezes the value of i by passing it to a new variable j, 
# so each function retains its own environment.
# If you don’t do this, you’d run into a scoping bug 
# where every function ends up using the final value of i.



# Exercise 3 – Map with Anonymous Function
# Use lapply() to multiply a list of numbers by 3 using an anonymous function.
nums <- 1:5
threes <- lapply(nums, function(x) x * 3)
unlist(threes)


# Exercise 4 – Function as Argument
# Write a function twice(f, x) that applies a function f to x twice.
twice <- function(f, x) {
    f(f(x))
}


# Exercise 5 – Chaining
# Use the pipe operator %>% to:
# 	1.	Create a numeric vector
# 	2.	Filter values > 5
# 	3.	Take the square root
# 	4.	Return the sum


library(magrittr) # Load required packages for %>%

# Pipe chaining
result <- 1:10 %>% # creates vector
  .[. > 5] %>%  # filters values greater than 5 (dot . refers to the left-hand side input)
  sqrt() %>%
  sum()

print(result)