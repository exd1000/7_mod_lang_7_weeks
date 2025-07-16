package main

import "fmt"

func main() {

	// Slices
	// • Dynamic arrays
	// • Can grow with append()
	// • Indexed access

	langs := []string{"Go", "Rust", "Python"}
	langs = append(langs, "Julia")
	fmt.Println(langs[0], langs[len(langs)-1])

	// Maps
	// • Key-value store
	// • Loop using for key, val := range map { ... }

	// scores := map[string]int{
	// 	"Alice": 88,
	// 	"Bob":   72,
	// }
	// fmt.Println(scores["Alice"])

	// Structs
	// • Like objects or records
	// • Define and access with dot (.)

	// type Student struct {
	// 	Name  string
	// 	Score int
	// 	Major string
	// }

	// s := Student{"Alice", 88, "CS"}
	// fmt.Println(s.Name, s.Score)

	// Exercise 1: Slices
	// Create a slice of your 4 favorite scientific concepts.
	// 	•	Print the first and last
	// 	•	Add one more with append()
	// 	•	Remove one with s = append(s[:index], s[index+1:]...)

	concepts := []string{"CogSci", "CompSci", "DataSci", "Philo"}
	concepts = append(concepts, "Psych")
	index := 2
	fmt.Println(concepts[:index], concepts[index+1]) // printed slices but didn't reassign after removal
	fmt.Println(concepts[len(concepts)-1])           // prints first/last

	// Exercise 2: Maps
	// Create a map of 3 tools and their roles.
	// Print: Tool is used for Role

	tools := map[string]string{
		"VS Code": "code editing",
		"Python":  "language",
	}

	for tool, role := range tools {
		fmt.Println(tool, "is used for", role)
	}

	// Exercise 3: Deduplication with Maps
	// Create a slice with duplicate tags, convert it into a map to remove duplicates.
	// Print the keys as unique values.

	dups := []string{"Benji", "Em", "Benji", "Beach", "Fun", "Music"}
	unique := make(map[string]bool)

	for _, val := range dups {
		unique[val] = true
	} // using map as python's set substitute (to remove duplicates)

	for tag := range unique {
		fmt.Println(tag)
	}
	// 💡 Could also use map[string]struct{} for true zero-cost keys.

	// Exercise 4: Student Scores with Map
	// Loop through and print:
	// Name: Rating
	// Use grading logic:
	// 	•	90+: Top-tier
	// 	•	75–89: Strong
	// 	•	50–74: Average
	// 	•	Below 50: Needs review

	scores := map[string]int{
		"Alice":   89,
		"Bob":     56,
		"Charlie": 92,
		"Diana":   33,
	}

	for name, score := range scores {
		var rating string
		if score >= 90 {
			rating = "Top-tier"
		} else if score >= 75 {
			rating = "Strong"
		} else if score >= 50 {
			rating = "Average"
		} else {
			rating = "Needs review"
		}
		fmt.Println(name, ":", rating)
	}

	// Exercise 5: Structs
	// Create a Student struct with Name, Score, and Major.
	// Loop through and print:
	// Alice (CS): Strong
	// Bob (Bio): Average

	type Student struct {
		Name  string
		Score int
		Major string
	}

	students := []Student{
		{"Alice", 89, "CS"},
		{"Bob", 56, "Bio"},
	}

	for _, student := range students {
		var rating string
		if student.Score >= 90 {
			rating = "Top-tier"
		} else if student.Score >= 75 {
			rating = "Strong"
		} else if student.Score >= 50 {
			rating = "Average"
		} else {
			rating = "Needs review"
		}
		fmt.Printf("%s (%s): %s\n", student.Name, student.Major, rating)
	}

}
