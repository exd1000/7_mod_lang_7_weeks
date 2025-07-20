// Week 4, Day 5 – Go: Error Handling & Testing 🐹⚙️

// error interface: Built-in way to represent recoverable errors
// errors.New(): Creates custom error messages
// panic() / recover(): For unrecoverable and catchable failures
// Testing in Go: Using testing package and go test

package main

import (
	"errors"
	"fmt"
)

// All helper functions outside of main func

// Basic Error Return
func divide(a, b float64) (float64, error) {
	if b == 0 {
		return 0, errors.New("division by zero")
	}
	return a / b, nil
}

// panic / recover
func risky() {
	defer func() {
		if r := recover(); r != nil {
			fmt.Println("Recovered from:", r)
		}
	}()
	panic("Something went wrong")
}

// Exercise 1 – Safe Division
// Write a Divide(a, b float64) (float64, error) function. Return an error if b == 0.
func Divide(a, b float64) (float64, error) {
	if b == 0 {
		return 0, errors.New("zero division")
	}
	return a / b, nil
}

// Exercise 2 – Custom Error Messages
// Write a function that returns a custom error when a username is empty.
func ValidateUsername(username string) error {
	if username == "" {
		return errors.New("empty username")
	}
	return nil
}

// Exercise 3 – Panic + Recover
// Write a function that panics if a number is negative, but wrap it in a recover() block.
func HandleNegative(n int) {
	defer func() {
		if r := recover(); r != nil {
			fmt.Println("recovery from:", r)
		}
	}()
	if n < 0 {
		panic("no negatives pls")
	}
	fmt.Println("valid number:", n)
}

// 	Exercise 4 – Option-like Handling with Zero Values
// 	Write a function that simulates Option: return an int if present,
// 	otherwise return default (-1), using Go’s idiomatic “zero value” checking.

func GetOptionalValue(x int) int {
	if x != 0 {
		return x
	}
	return -1
}

// Now actual main()
func main() {
	// Test out whatever here
	res, err := divide(10, 2)
	if err != nil {
		fmt.Println("Error:", err)
	} else {
		fmt.Println("Result:", res)
	}

	risky()
	HandleNegative(5)
	HandleNegative(-3)
}
