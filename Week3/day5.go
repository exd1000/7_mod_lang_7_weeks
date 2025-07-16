package main

import (
	"bufio"
	"encoding/json"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func main() {
	// Read a File Line-by-Line
	file, _ := os.Open("fields.txt")
	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		fmt.Println(scanner.Text())

	}

	// Write to a File
	os.WriteFile("tools.txt", []byte("VS Code is an Editor\n"), 0644)

	// Append to a File
	f, _ := os.OpenFile("ideas.txt", os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
	defer f.Close()
	f.WriteString("New idea\n")

	// JSON Struct Handling
	// type Student struct {
	// 	Name  string `json:"name"`
	// 	Score int    `json:"score"`
	// 	Major string `json:"major"`
	// }

	// student := Student{"Alice", 89, "CS"}
	// data, _ := json.MarshalIndent(student, "", "  ")
	// os.WriteFile("student.json", data, 0644)

	// Exercise 1: Read from fields.txt
	// Print: Field: AI and so on.

	fieldsFile2, _ := os.Open("fields.txt")
	scan := bufio.NewScanner(fieldsFile2)
	for scan.Scan() {
		fmt.Println(scan.Text())
	}

	// ⚠️  i is unused
	//  Should be removed or replaced with a fresh name

	// Exercise 2: Write Dictionary to tools.txt
	// Write: VS Code is an Editor ...

	tools := map[string]string{
		"VS Code": "Editor",
		"Python":  "Language",
		"Notion":  "Notes",
	}

	var content string
	for tool, role := range tools {
		content += fmt.Sprintf("%s is a %s.\n", tool, role)
	}

	os.WriteFile("tools.txt", []byte(content), 0644)

	// Exercise 3: Append Research Idea
	// Use bufio.NewReader(os.Stdin) to capture input and append it to ideas.txt.

	fmt.Print("Research idea? ")
	reader := bufio.NewReader(os.Stdin)
	idea, _ := reader.ReadString('\n')
	idea = strings.TrimSpace(idea)

	ideaFile, _ := os.OpenFile("ideas.txt", os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)

	defer ideaFile.Close()
	ideaFile.WriteString(idea + "\n")

	// 🟡 Code is mostly correct, but:
	// ⚠️ You re-declared file again (used earlier!)
	// You’re missing import "strings" at the top

	// Exercise 4: Write + Read JSON
	// Write to student.json and read it back to print fields.
	// Student{"Alice", 89, "CS"}

	type Student struct {
		Name  string `json:"name"`
		Score int    `json:"score"`
		Major string `json:"major"`
	}

	student := Student{"Alice", 89, "CS"}
	data, _ := json.MarshalIndent(student, "", "  ")
	os.WriteFile("student.json", data, 0644)

	// f, i := os.Open("student.json")
	// scan := bufio.NewScanner(f)
	// for scan.Scan() {
	// 	fmt.Println(scan.Text())
	// }

	// You’re printing the JSON text, but not deserializing it.
	// ✅ Better: use json.Unmarshal():
	raw, _ := os.ReadFile("student.json")
	var s Student
	json.Unmarshal(raw, &s)
	fmt.Println(s.Name, s.Score, s.Major)

	// 	Exercise 5: Score Filtering
	// Create scores.txt:
	// 92
	// 45
	// 88
	// 51
	// 33
	// Read the file and print scores ≥ 50.

	// ✅ Here’s the corrected version:
	scores := []int{92, 45, 88, 51, 33}
	var scoreLines string
	for _, score := range scores {
		scoreLines += fmt.Sprintf("%d\n", score)
	}
	os.WriteFile("scores.txt", []byte(scoreLines), 0644)

	scoreFile, _ := os.Open("scores.txt")
	defer scoreFile.Close()
	scoreScanner := bufio.NewScanner(scoreFile)
	for scoreScanner.Scan() {
		line := scoreScanner.Text()
		num, _ := strconv.Atoi(line)
		if num >= 50 {
			fmt.Println(num)
		}
	}

	// ❌ There are multiple issues:
	// •	for score := range scores gives the index, not the value
	// •	You cannot += fmt.Println(...)
	// •	os.WriteFile("scores.txt", []int(content)) is invalid — content is a string
	// scores := []int{92,45,88,51,33}
	// for score := range scores {
	// 	content += fmt.Println(score)
	// }
	// os.WriteFile("scores.txt", []int(content))

	// filter := os.Open("scores.txt")
	// if score >= 50 {
	// 	for scanner.Scan() {
	// 		fmt.Println(filter.Text())
	// 	}

	// }

}
