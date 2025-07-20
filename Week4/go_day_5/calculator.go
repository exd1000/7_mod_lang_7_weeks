package main

import (
	"errors"
)

// 	Exercise 5 – Calculator + Tests
// 	Create a small calculator.go file with:
// 	Add, Subtract, Multiply, Divide (returns error if divide by zero)

// 	Then create calculator_test.go and:
// 		•	✅ Test all normal cases
// 		•	❌ Include one failing test for divide-by-zero

func Add(a, b int) int      { return a + b }
func Subtract(a, b int) int { return a - b }
func Multiply(a, b int) int { return a * b }
func DivideInt(a, b int) (int, error) {
	if b == 0 {
		return 0, errors.New("zero division")
	}
	return a / b, nil
}
