# Week 5 – Day 7: Julia – Functional Programming & Composition


# Julia is a multiple dispatch language that also excels at functional programming
# making it perfect for expressive, high-performance code. 
# Today you’ll explore how Julia handles first-class functions, closures, broadcasting, and composition.


# First-class functions – assign to variables, pass/return from other functions
#     ex: f(x) = x + 1
# Function composition – ∘ and |> (pipe)
#     ex: f ∘ g or f(g(x))
# Anonymous functions – 
#     ex1: x -> x * 2
#     ex2: x -> x^2
# Higher-order functions – map, filter, etc.
#     ex: map(f, xs) or custom apply_twice(f, x)
# Closures – functions that capture outer variables
#     ex: make_adder(n) = x -> x + n
# Broadcasting – functional operations over arrays: f.(arr)
#     ex: f.(xs) applies f elementwise



# First-Class & Anonymous Functions
double = x -> x * 2
double(5)  # 10

add = function(x, y)
    x + y
end
add(3, 4)  # 7

f = x -> x^2
f(4)  # 16


# Higher-Order Functions
map(x -> x^2, [1, 2, 3])  # [1, 4, 9]
filter(x -> x > 1, [1, 2, 3])  # [2, 3]


# Function Composition (∘)
f(x) = x + 1
g(x) = x * 2
h = f ∘ g  # h(x) = f(g(x))
h(3)  # 7

double(x) = 2x
square(x) = x^2
composed = square ∘ double
composed(3)  # (2*3)^2 = 36

add1(x) = x + 1
double(x) = x * 2
f = double ∘ add1
f(3)  # (3 + 1) * 2 = 8


# Piping (|>)
3 |> double |> sqrt  # sqrt(6) ≈ 2.45


# Closure
function make_multiplier(n)
    return x -> x * n
end
times3 = make_multiplier(3)
times3(5)  # 15


function make_adders(n)
    [let j = i
        x -> x + j
     end for i in 1:n]
end
adders = make_adders(3)
adders   # 11
adders   # 12
adders   # 13


# Broadcasting
double.(1:5)  # [2, 4, 6, 8, 10]




# Exercise 1 – Function Factory
# Create a function make_adder(n) that returns a function adding n to input.
function make_adder(n)


# Exercise 2 – Apply Twice
# Write apply_twice(f, x) that applies a function f to x two times.
function twice(f, x)
    f(f(x))
end

twice(x -> x + 1, 3)  # 5

# Exercise 3 – Anonymous Map
# Use map(x -> x^2, [1,2,3,4]) to square each number.


# Exercise 4 – Composition
# Use ∘ to compose two functions double and square, then test.


# Exercise 5 – Broadcasting
# Write a negate(x) function and broadcast it across a vector.


# Exercise 6 – Chain Operations
# Create a pipeline that:
# 	1.	Starts from a vector [1,2,3,4,5,6]
# 	2.	Filters values > 3
# 	3.	Squares them
# 	4.	Returns the sum

using Statistics

[1,2,3,4,5,6] |>
    x -> filter(y -> y > 3, x) |>
    x -> map(y -> y^2, x) |>
    sum  # 77
