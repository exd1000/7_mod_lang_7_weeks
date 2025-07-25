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

// Exercise 1 – Person Struct
// Create a Person struct with Name string and Age int.
// Add a method Greet() string that returns "Hi, I'm NAME and I'm AGE years old."

// Exercise 2 – Constructor
// Write a constructor function NewPerson(name string, age int) Person that returns a new Person.

// Exercise 3 – Interface Implementation
// Define a Greetable interface with Greet() string.
// Implement it for Person, Robot, and Alien.

// Exercise 4 – Encapsulation
// Create a User struct with:
// 	•	username string (public)
// 	•	password string (private)
// 	•	Method CheckPassword(p string) bool
// •	Constructor NewUser(username, password string) *User

// Exercise 5 – Polymorphism
// Write a sayHello(g Greeter) function that takes a Greetable interface and prints the greeting.
// Use it with Person, Robot, and Alien.

// Exercise 6 – Composition
// Create an Admin struct that embeds User and adds Level (int).
// Make it so you can still access CheckPassword() via Admin.

func exercises() {
	p := NewPerson("Em", 27)
	r := Robot{ID: "XJ9"}
	a := Alien{Name: "Zorg"}

	sayHello(p)
	sayHello(r)
	sayHello(a)

	u := NewUser("em", "secret")
	fmt.Println("Password match?", u.CheckPassword("wrong"))

	admin := Admin{User: *u, Level: 5}
	fmt.Println("Admin username:", admin.Username)
	fmt.Println("Password correct?", admin.CheckPassword("secret"))
}

func main() {
	examples()
	exercises()
}
