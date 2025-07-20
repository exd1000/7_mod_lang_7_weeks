# Week 4, Day 6: R – Error Handling & Testing 🎯

# tryCatch() – structured error handling
# stop(), warning(), message() – for throwing, warning, or messaging
# testthat::test_that() package – standard testing framework in R
# browser() - drop into debugger interactively
# traceback() - view stack trace after an error


#  tryCatch for Error Handling
safe_divide <- function(a, b) {
  tryCatch({
    a / b
  }, warning = function(w) {
    message("Warning: ", conditionMessage(w))
    NA
  }, error = function(e) {
    message("Error: ", conditionMessage(e))
    NA
  })
}

safe_divide(10, 2)   # → 5
safe_divide(10, 0)   # → "Error: division by zero" → NA


clean_value <- function(x) {
  tryCatch({
    log(x)  # will fail if x <= 0
  }, warning = function(w) {
    message("⚠️ Warning: ", w$message)
    return(NA)
  }, error = function(e) {
    message("❌ Error: ", e$message)
    return(NA)
  })
}


clean_value(10)   # ✅ 2.302585
clean_value(0)    # ❌ Error handled, returns NA
clean_value(-5)   # ❌ Error handled, returns NA


# stop(), warning(), and message()
check_value <- function(x) {
  if (x < 0) {
    warning("Negative number detected")
  } else if (x == 0) {
    message("Value is zero")
  } else if (x > 100) {
    stop("Value too large!")
  } else {
    print("Value is acceptable")
  }
}

check_value(50)     # → "Value is acceptable"
check_value(-2)     # → Warning
check_value(0)      # → Message
# check_value(150)   → Error and stop


validate_input <- function(x) {
  if (!is.numeric(x)) {
    stop("Input must be numeric!")  # halts execution
  }
  if (any(is.na(x))) {
    message("ℹ️ Input contains NA values.")
  }
  if (any(x < 0)) {
    warning("Negative numbers detected.")
  }
  return(TRUE)
}

# Try it:
validate_input(c(1, 2, 3))           # ✅
# validate_input(c(1, NA, 3))          ℹ️ Message
validate_input(c(1, -5, 3))          # ⚠️ Warning
# validate_input("hello")              ❌ Error


# Handling NA Gracefully
parse_int <- function(x) {
  tryCatch({
    as.integer(x)
  }, warning = function(w) {
    NA
  }, error = function(e) {
    NA
  })
}

parse_int("42")       # → 42
parse_int("oops")     # → NA



# Unit Tests with testthat
# 🛠️ To run these: save to test-add.R, and then in R console: 
#     testthat::test_file("test-add.R")
library(testthat)

add <- function(a, b) {
  a + b
}

test_that("basic addition works", {
  expect_equal(add(2, 3), 5)
  expect_equal(add(-1, 1), 0)
})

test_that("adding NA returns NA", {
  expect_true(is.na(add(NA, 2)))
})



safe_divide <- function(a, b) {
  tryCatch({
    a / b
  }, error = function(e) {
    return(NA)
  })
}

# Tests
test_that("safe_divide works", {
  expect_equal(safe_divide(10, 2), 5)
  expect_equal(safe_divide(10, 0), NA_real_)
  expect_equal(safe_divide(-10, 2), -5)
})


# Debugging with browser() and traceback()
compute_mean <- function(df, colname) {
  tryCatch({
    browser()  # Pauses execution here
    mean(df[[colname]], na.rm = TRUE)
  }, error = function(e) {
    message("Column not found: ", colname)
    traceback()
    return(NA)
  })
}

# Example usage
data <- data.frame(age = c(20, 30, NA))
compute_mean(data, "age")     # ✅ Works
compute_mean(data, "height")  # ❌ Triggers browser + error

# Logging to a File with sink()
# You can record all warnings and messages to a log file:
log_file <- "log.txt"
sink(log_file, type = "message")

# Now all messages will go to the file
message("This is a log message")
warning("This is a warning!")

sink(type = "message")  # Reset



# Exercise 1 – Safe Numeric Conversion
# Write a function safe_as_numeric(x) that converts x to numeric and returns NA if it fails. Use tryCatch().

safe_as_numeric <- function(x) {
  tryCatch({
    as.numeric(x)
  }, warning = function(w) {
    NA
  }, error = function(e) {
    NA
  })
}

# Exercise 2 – Email Validator
# Write a function validate_email(email) that checks if it contains "@", else calls stop() with a custom error message.


validate_email <- function(email) {
  if (!grepl("@", email)) {
    stop("Invalid email: '@' missing")
  }
  TRUE
}


# Exercise 3 – Warning Logger
# Create a function warn_if_negative(x) that issues a warning if x < 0, and prints a confirmation if x >= 0.


warn_if_negative <- function(x) {
  if (x < 0) {
    warning("Negative value detected")
  } else {
    message("Value is non-negative")
  }
}


# Exercise 4 – Custom Error Recovery
# Write a function risky_divide(a, b) that returns a/b, but if b == 0, handles it with tryCatch and returns "fail".


risky_divide <- function(a, b) {
  tryCatch({
    if (b == 0) stop("Division by zero")
    a / b
  }, error = function(e) {
    "fail"
  })
}


# Exercise 5 – testthat Unit Tests
# Write a test suite using the testthat package for a simple function square(x) = x^2.


library(testthat)

square <- function(x) x^2

test_that("square works", {
  expect_equal(square(2), 4)
  expect_equal(square(-3), 9)
})

test_that("square of 0", {
  expect_equal(square(0), 0)
})

test_that("square with NA returns NA", {
  expect_true(is.na(square(NA)))
})



# Exercise 1: Basic Error Handling
# Write a function safe_divide(a, b) that returns a / b, but catches division-by-zero errors and returns NA.




# Exercise 2: Custom Error Messages
# Create a function validate_input(x) that stops execution if x is not a numeric vector, with a clear error message.



# Exercise 3: Logging with message() and warning()
# Modify the validate_input() function to:
# 	•	Use message() if x contains any NAs
# 	•	Use warning() if x contains negative numbers



# Exercise 4: Unit Testing
# Use the testthat package to write 3 unit tests for your safe_divide() function:
# 	•	Dividing 10 by 2 returns 5
# 	•	Dividing by 0 returns NA
# 	•	Negative division works correctly



# Exercise 5: Debugging
# Write a broken function called compute_mean(df, colname) that crashes if the column doesn’t exist.
# Use tryCatch() and browser() inside it so that you can debug it interactively when it fails.


