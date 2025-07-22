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

class Person {
  name: string;
  age: number;

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }

  greet(): string {
    return `Hi I'm ${this.name} and I'm ${this.age} years old.`
  }

  // Add a static method isAdult(age: number): boolean to Person that returns true if age ≥ 18.

  static isAdult(age: number): boolean {
    if (age >= 18) {
      return true;
      } else {
        return false;
      }
  }

// ✅ static isAdult() works, though can be simplified:
//   static isAdult(age: number): boolean {
//     return age >= 18;
//   }

}

const eli = new Person('eli', 17);
console.log(eli.greet()); 
console.log(Person.isAdult(eli.age));

//  Exercise 2 – Inheritance
// Create a base class Vehicle with:
// 	•	speed: number
// 	•	Method drive() that logs "Driving at SPEED mph"

class Vehicle {
  speed: number; 

  constructor(speed:number) {
    this.speed = speed;
  }

  drive(): void {
    console.log(`Driving at ${this.speed} mph`);
  }
}

const v = new Vehicle(12);
console.log(v.drive());

// Subclass it into:
// 	•	Car, adding a brand and overriding drive() to say "Brand car driving at SPEED mph"

class Car extends Vehicle {
  brand: string; 
  constructor(speed: number, brand: string) {
    super(speed);
    this.brand = brand;
  }

  drive(): void {
    console.log(`${this.brand} car driving at ${this.speed} mph`);
  }
}

const c = new Car(12, 'honda');
console.log(c.drive());


// Exercise 3 – Access Modifiers
// Add a User class with:
// 	•	private _password: string
// 	•	public username: string
// 	•	Method checkPassword(p: string): boolean


class User {
  private _password: string;
  username: string;

  constructor(password: string, username:string) {
    this._password = password;
    this.username = username;
  }

  checkPassword(p:string): boolean {
    if (p == this._password) {
      return true;
    } else {
      return false;
    }
  }
}


const pass = new User('hey','em');
console.log(pass.checkPassword('hi'))


// Exercise 4 – readonly Fields
// Create a Book class with:
// 	•	readonly title: string
// 	•	author: string
//  • year: number
// 	•	Method summary() that returns "TITLE by AUTHOR"

class Book {
  readonly title: string;
  author: string;
  year: number;

  constructor(title: string, author: string, year:number) {
    this.title = title;
    this.author = author;
    this.year = year;
  }

  summary(): string {
    return `${this.title} by ${this.author} (${this.year})`
  }
}

const b = new Book('twilight','steph meyers',2005);
console.log(b.summary());


// Exercise 5 – Static Methods
// Create a utility class Converter with a static method kmToMiles(km: number): number.

class utilConverter {
  static kmToMiles(km: number): number {
    return km * 0.62;
  }
 }

 console.log(utilConverter.kmToMiles(12)); // ✅ call static method on class
 
// const convert = new utilConverter(12); // ❌ constructor doesn't exist
// console.log(convert.kmToMiles); // ❌ kmToMiles is a static method

// Exercise 6 –Interface + Implementation
// Define an interface Shape with method area(): number
// Create two classes Circle and Rectangle that implement it.

interface Shape {
  area(): number; 
}

class Circle implements Shape {
  radius: number;
  constructor(radius: number) {
    this.radius = radius;
  }

  area(): number {
    return Math.PI * this.radius**2;
  }
}

class Rectangle implements Shape {
  width: number;
  height: number; 
  constructor(width: number, height:number) {
    this.width = width;
    this.height = height;
  }

  area(): number {
    return this.width * this.height;
  }
}

const circ = new Circle(3); 
console.log('Circle area:', circ.area());

const r = new Rectangle(4,5);
console.log('Rectangle area:', r.area());