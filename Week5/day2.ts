// Week 5 – Day 2: TypeScript – Object-Oriented Programming
// Focus: class, constructor, public/private, readonly, extends, method overriding, and static methods

// Define a class - class MyClass {}
// Constructor - constructor(param: Type) {}
// Access modifiers - public, private, protected
// Read-only - readonly
// Inheritance - class Child extends Parent {}
// Method override - Redefine method in child
// Static methods - static methodName()

// Special Features of TypeScript OOP
// 	•	private and protected actually enforce access control at compile time
// 	•	readonly fields can be set only once
// 	•	Interfaces can be used to describe class shapes (implements)
// 	•	Type inference works across hierarchies

// You can run TypeScript OOP code by:
// tsc myfile.ts && node myfile.js


// Classes in TypeScript
class Animal {
  name: string;

  constructor(name: string) {
    this.name = name;
  }

  speak(): string {
    return `${this.name} makes a sound`;
  }
}

// Inheritance
class Dog extends Animal {
  breed: string;

  constructor(name: string, breed: string) {
    super(name);
    this.breed = breed;
  }

  speak(): string {
    return `${this.name} barks!`;
  }
}

// class Animal {
//   constructor(public name: string) {}
//   makeSound(): void {
//     console.log("Some generic sound");
//   }
// }

// class Dog extends Animal {
//   makeSound(): void {
//     console.log("Woof!");
//   }
// }

const fido = new Dog("Fido", "Labrador");
console.log(fido.speak()); // Fido barks!


class Person {
  name: string;
  age: number;

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }

  greet(): string {
    return `Hi, I'm ${this.name} and I'm ${this.age} years old.`;
  }
}

// Access Modifiers
// 	•	public: default, accessible everywhere
// 	•	private: only inside the class
// 	•	protected: inside the class and subclasses

class BankAccount {
  private balance: number;

  constructor(initialBalance: number) {
    this.balance = initialBalance;
  }

  getBalance(): number {
    return this.balance;
  }
}

// Static Methods & Properties
class MathUtils {
  static PI = 3.14;

  static square(x: number): number {
    return x * x;
  }
}

// Interfaces
interface Shape {
  area(): number;
}


// EXERCISES 

// Exercise 1 – Person Class
// Create a Person class with:
// 	•	name: string, age: number
// 	•	A method greet() that returns: "Hi, I'm NAME and I'm AGE years old."


// Create a Book class with:
// 	•	title, author, year
// 	•	A method summary() that returns a string


//  Exercise 2 – Inheritance
// Create a base class Vehicle with:
// 	•	speed: number
// 	•	Method drive() that logs "Driving at SPEED mph"

// Subclass it into:
// 	•	Car, adding a brand and overriding drive() to say "Brand car driving at SPEED mph"


// Exercise 3 – Access Modifiers
// Add a User class with:
// 	•	private _password: string
// 	•	public username: string
// 	•	Method checkPassword(p: string): boolean

// Exercise 4 – readonly Fields
// Create a Book class with:
// 	•	readonly title: string
// 	•	author: string
// 	•	Method summary() that returns "TITLE by AUTHOR"



// Exercise 5 – Static Methods
// Add a static method isAdult(age: number): boolean to Person that returns true if age ≥ 18.


// Create a utility class Converter with a static method kmToMiles(km: number): number.


// Exercise 6 –Interface + Implementation
// Define an interface Shape with method area(): number
// Create two classes Circle and Rectangle that implement it.