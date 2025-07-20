# Week 4 – Day 7: Julia – Error Handling, Logging, and Testing

# try / catch / finally - Structured error handling
# error(), throw(), @warn, @info - Throwing and logging errors
# Test stdlib - Unit testing framework
# @test, @test_throws, @test_warn - Assertions for unit tests
# @assert - For invariants
# stacktrace() - Built-in by default on failure


# Basic Error Handling

function safe_divide(a, b)
    try
        return a / b
    catch e
        println("❌ Error: ", e)
        return NaN
    end
end

safe_divide(10, 2)   # → 5.0
safe_divide(10, 0)   # → Error: DivideError → NaN

# Custom error
function validate_username(username)
    if isempty(username)
        error("Username cannot be empty")
    else
        println("Valid username")
    end
end

validate_username("juno")   # OK
# validate_username("")     # Raises error

# @warn and Logging
function check_value(x)
    if x < 0
        @warn "Negative value: $x"
    elseif x == 0
        println("Value is zero")
    else
        println("Good value: $x")
    end
end

check_value(5)
check_value(-3)
check_value(0)

# Unit Testing with Test
# julia --project -e 'using Test; include("your_test_file.jl")'
using Test

square(x) = x^2

@test square(2) == 4
@test square(-3) == 9
@test_throws DomainError sqrt(-1)


# @assert for Invariants
function assert_positive(x)
    @assert x >= 0 "Value must be non-negative"
    return sqrt(x)
end

assert_positive(4)   # √4
# assert_positive(-1)  # AssertionError
    

# Exercise 1: Basic try/catch
# Write a function safe_parse_float(s) that parses a string to a Float64 and returns NaN if it fails.
function safe_parse_float(s)
    try
        return parse(Float64, s)
    catch 
        return NaN
    end
end 

# Exercise 2: Custom Error and Logging
# Create a function validate_email(email) that throws an error if the string does not contain "@". 
# Log an info message on success.
function validate_email(email)
    if occursin('@', email)
        @info "Valid email"
        # println("Valid email")
    else 
        error("Invalid email")
    end
end


# ❗ Improvement: use @info instead of println() for logging per spec

# Exercise 3: Warning Function
# Write a function warn_if_empty(arr) that issues a warning if the array has zero length and returns the length otherwise.

function warn_if_empty(arr)
    if length(arr) == 0
        @warn "array has zero length"
    else
        return length(arr)
    end
end

# Exercise 4: Unit Testing
# Create tests using the Test module for:
# 	•	A double(x) function
# 	•	An edge case: double("a") throws a MethodError

using Test 
double(x) = x*x

@test double(2) == 4
@test_throws MethodError double("a")


# Exercise 5: Fault-Tolerant Calculation
# Write robust_mean(arr) that catches errors if arr is empty or contains non-numeric values, and returns NaN.

function robust_mean(arr)
    try
        if isempty(arr)
            error("Empty array")
        elseif any(x -> !(x isa Number), arr)
            error("Non-numeric value found")
        else
            return mean(arr)
        end
    catch e
        println("❌ Error: ", e)
        return NaN
    end
end

# ❌ Logic issues:
# 	•	return array → typo
# 	•	len() is not defined in Julia → use length()
# 	•	any(x -> !(x isa Number), arr) is good, but it’s outside the try

# function robust_mean(arr)
#     try
#         return array
#     catch e
#         if len(arr) == 0
#             println("error: ",e)
#             return NaN
#         elseif any(x -> !(x isa Number), arr)
#             println("error: ", e)
#             return NaN
#         end
#     end
# end
    