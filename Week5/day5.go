// Week 5, Day 5: Go – Composition-Based Object-Oriented Programming

// Class - struct defines types
// Method - attached to structs; func (t Type) methodName(){}
// Constructor - custom function; func NewType(...) *Type {}
// Composition (not inheritance) - struct embedding: type Manager struct { Employee }
// Interfaces - define behavior implicit contracts (duck typing); interface { MethodName() ReturnType }
// Polymorphism - interface + method sets; interface implementation by any type
// Encapsulation - uppercase = exported; exported fields (Name) vs unexported/private fields (name)

// No classes. No inheritance. No this. No keywords like extends.
// But Go supports everything needed for encapsulation, polymorphism, and abstraction with no magic.

// Run code: go run main.go

// Examples
package main

import (
	"fmt"
)

// Struct with method
type Person struct {
	Name string
	Age  int
}

func (p Person) Greet() string {
	return fmt.Sprintf("Hi, I'm %s and I'm %d years old.", p.Name, p.Age)
}

// Interface
type Greeter interface {
	Greet() string
}

func sayHello(g Greeter) {
	fmt.Println(g.Greet())
}

// Interface implementation
type Robot struct {
	ID string
}

func (r Robot) Greet() string {
	return "Beep boop. I am robot " + r.ID
}

// Composition
type User struct {
	Username string
	password string // private (lowercase = unexported)
}

func (u *User) CheckPassword(input string) bool {
	return u.password == input
}

func NewUser(username, password string) *User {
	return &User{Username: username, password: password}
}

// Embedding: reuse behavior
type Admin struct {
	User  // embeds User struct
	Level int
}

func examples() {
	p := Person{"Em", 27}
	fmt.Println(p.Greet())

	r := Robot{"XJ9"}
	fmt.Println(r.Greet())

	u := NewUser("admin", "1234")
	fmt.Println(u.CheckPassword("wrong")) // false

	a := Admin{User: *u, Level: 10}
	fmt.Println(a.Username) // from embedded User
}

// EXERCISES

// Exercise 1 – Human Struct
// Create a Human struct with Name string and Age int.
// Add a method Greet() string that returns "Hi, I'm NAME and I'm AGE years old."
type Human struct {
	Name string
	Age  int
}

// func (h Human) Greet() string {
// 	return fmt.Sprintf("Hi I'm %s and I'm %d years old", h.Name, h.Age)
// }

// Exercise 2 – Constructor
// Write a constructor function NewHuman(name string, age int) Human that returns a new Human.
func NewHuman(name string, age int) *Human {
	return &Human{Name: name, Age: age}
}

// Exercise 3 – Interface Implementation
// Define a Greetable interface with Greet() string.
// Implement it for Human, Robot, and Alien.
type Greetable interface {
	Greet() string
}

func (h Human) Greet() string {
	return fmt.Sprintf("Hi I'm %s and I'm %d years old", h.Name, h.Age)
}

type Robot1 struct {
	Name string
}

func (r Robot1) Greet() string {
	return fmt.Sprintf("I am %s", r.Name)
}

type Alien struct {
	Name     string
	Location string
}

func (a Alien) Greet() string {
	return fmt.Sprintf("I'm an %s from %s", a.Name, a.Location)
}

// Exercise 4 – Encapsulation
// Create a User struct with:
//   - username string (public)
//   - password string (private)
//   - Method CheckPassword(p string) bool
//
// •	Constructor NewUser(username, password string) *User
type User1 struct {
	Username string // uppercase = exported (public)
	password string // lowercase = unexported (private)
}

func (u *User1) CheckPassword(p string) bool {
	return u.password == p
}

func NewUser1(username, password string) *User1 {
	return &User1{Username: username, password: password}
}

// Exercise 5 – Polymorphism
// Write a sayHi(g Greetable) function that takes a Greetable interface and prints the greeting.
// Use it with Human, Robot, and Alien.
func sayHi(g Greetable) {
	fmt.Println(g.Greet())
}

// func (h Human) sayHi() string {
// 	return "Hi I'm " + h.Name
// }

// func (r Robot1) sayHi() string {
// 	return "Hi I'm a " + r.Name
// }

// func (a Alien) sayHi() string {
// 	return "Hi I'm " + a.Name
// }

// You could simplify sayHi() methods declared directly on Human, Robot1, and Alien,
// or remove them if unused (they’re not tied to the interface).
// Aren’t actually used since you’re calling the sayHi(g Greetable) function instead.
// ✅ Either remove them (cleaner),
// 🔁 Or call them directly for contrast:
// 	fmt.Println(h.sayHi())

// Exercise 6 – Composition
// Create an Admin struct that embeds User and adds Level (int).
// Make it so you can still access CheckPassword() via Admin.
type Admin1 struct {
	User1
	Level int
}

func exercises() {
	h := Human{"Em", 27}
	r := Robot{ID: "XJ9"}
	a := Alien{Name: "Zorg", Location: "Space"}

	// optionally can use constructor for PARENTHESES
	// instead of structs for BRACKETS:
	// h := NewHuman("Em", 27)

	sayHi(h)
	sayHi(r)
	sayHi(a)

	u := NewUser1("em", "secret")
	fmt.Println("Password match?", u.CheckPassword("hi"))

	admin := Admin1{User1: *u, Level: 5}
	fmt.Println("Admin username:", admin.Username)
	fmt.Println("Password correct?", admin.CheckPassword("secret"))
}

func main() {
	examples()
	exercises()
}
