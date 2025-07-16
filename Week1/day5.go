package main

import "fmt"

func main() {

	// variables

	var age int = 32
	name := "Alice" // shorthand declaration
	fmt.Println("Name:", name)
	fmt.Println("Age:", age)

	// Go is statically typed but := lets you infer types quickly

	// if/else

	if age > 30 {
		fmt.Println("Experienced")
	} else if age > 20 {
		fmt.Println("Getting there")
	} else {
		fmt.Println("Just starting")
	}
	// Go doesn't need parentheses around conditions but curly brackets {} are required

	// switch >>

	// redeclaring variables using := after they’ve already been declared (comment out)

	/* hour := 10
	switch hour {
	case 6, 7, 8, 9, 10, 11:
		fmt.Println("Morning")
	case 12, 13, 14, 15:
		fmt.Println("Afternoon")
	case 16, 17, 18, 19:
		fmt.Println("Evening")
	default:
		fmt.Println("Night")
	}

	Go's switch is powerful & doesn't require break only
	evaluates first matching case by default */

	// for loops
	// Go only has one loop keyword i.e. for but behaves like all 3 from other languages

	for i := 0; i < 5; i++ {
		fmt.Println(i)
	}

	/* for _, city := range cities {
		fmt.Println(city, "is a major city")
	}
	declared in example >> commented out
	*/

	i := 0
	for i < 3 {
		fmt.Println("Looping")
		i++
	}

	/* real world example

	scores := []int{88, 74, 95, 67, 40}
	for _, score := range scores {
		if score >= 90 {
			fmt.Println("Top-tier")
		} else if score >= 75 {
			fmt.Println("Strong")
		} else if score >= 50 {
			fmt.Println("Average")
		} else {
			fmt.Println("Needs review")
		}
	}
	*/

	/* Ex1: Basic If/Else
	Create a variable temperature and print
	•	“Hot” if >30
	•	“Warm” if 15–30
	•	“Cold” if <15 */

	temp := 12
	if temp > 30 {
		fmt.Println("Hot")
	} else if temp >= 15 && temp <= 30 {
		fmt.Println("Warm")
	} else {
		fmt.Println("Cold")
	}

	/* Ex2: Switch on Hour
	Declare an hour (0–23) and use switch to print:
	•	Morning (6–11)
	•	Afternoon (12–15)
	•	Evening (16–19)
	•	Night (others) */

	hour := 10
	switch hour {
	case 6, 7, 8, 9, 10, 11:
		fmt.Println("Morning")
	case 12, 13, 14, 15:
		fmt.Println("Afternoon")
	case 16, 17, 18, 19:
		fmt.Println("Evening")
	default:
		fmt.Println("Night")
	}

	/* Tip: You could collapse these into ranges with switch
	{ case hour >= 6 && hour <= 11: ... }
	but Go’s case-style is great for readability here. */

	/* Ex3: Loop Over Cities
	Given Loop through and print:
	"Tokyo is a major city.", etc. */

	cities := []string{"Tokyo", "Paris", "New York"}
	for _, city := range cities {
		fmt.Println(city, "is a major city")
	}

	/* Ex4: Score Classification

	Given Use if to print for each:
	•	90+: Top-tier
	•	75–89: Strong
	•	50–74: Average
	•	Below 50: Needs review */

	scores := []int{88, 74, 95, 67, 40}
	for _, score := range scores {
		if score >= 90 {
			fmt.Println("Top-tier")
		} else if score >= 75 {
			fmt.Println("Strong")
		} else if score >= 50 {
			fmt.Println("Average")
		} else {
			fmt.Println("Needs review")
		}
	}

	/* Ex5: Map Challenge

	Loop over the map and print:
	Alice: Strong
	Bob: Average
	Charlie: Top-tier
	Diana: Needs review */

	testResults := map[string]int{
		"Alice":   89,
		"Bob":     56,
		"Charlie": 92,
		"Diana":   33,
	}

	// for name, score := range testResults {
	// 	if score >= 90 {
	// 		fmt.Println(("Top-tier"))
	// 	} else if score >= 75 {
	// 		fmt.Println("Strong")
	// 	} else if score >= 50 {
	// 		fmt.Println("Average")
	// 	} else {
	// 		fmt.Println("Needs review")
	// 	}
	// 	fmt.Println(name, ":", score)
	// }

	/* ❌ Minor issues:
	•	fmt.Println(name,":"score) → syntax error
	•	":"score is invalid — use fmt.Println(name, ":", score)
	•	You print the grade on one line and name/score on another — not per prompt

	🔧 Fix: Combine grade + name in one output */

	for name, score := range testResults {
		var grade string
		if score >= 90 {
			grade = "Top-tier"
		} else if score >= 75 {
			grade = "Strong"
		} else if score >= 50 {
			grade = "Average"
		} else {
			grade = "Needs review"
		}
		fmt.Println(name + ": " + grade)
	}

}
