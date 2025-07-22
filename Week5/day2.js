// Week 5 – Day 2: TypeScript – Object-Oriented Programming
// Focus: class, constructor, public/private, readonly, extends, method overriding, and static methods
var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (Object.prototype.hasOwnProperty.call(b, p)) d[p] = b[p]; };
        return extendStatics(d, b);
    };
    return function (d, b) {
        if (typeof b !== "function" && b !== null)
            throw new TypeError("Class extends value " + String(b) + " is not a constructor or null");
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
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
var Animal = /** @class */ (function () {
    function Animal(name) {
        this.name = name;
    }
    Animal.prototype.speak = function () {
        return "".concat(this.name, " makes a sound");
    };
    return Animal;
}());
// Inheritance
var Dog = /** @class */ (function (_super) {
    __extends(Dog, _super);
    function Dog(name, breed) {
        var _this = _super.call(this, name) || this;
        _this.breed = breed;
        return _this;
    }
    Dog.prototype.speak = function () {
        return "".concat(this.name, " barks!");
    };
    return Dog;
}(Animal));
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
var fido = new Dog("Fido", "Labrador");
console.log(fido.speak()); // Fido barks!
// Access Modifiers
// 	•	public: default, accessible everywhere
// 	•	private: only inside the class
// 	•	protected: inside the class and subclasses
var BankAccount = /** @class */ (function () {
    function BankAccount(initialBalance) {
        this.balance = initialBalance;
    }
    BankAccount.prototype.getBalance = function () {
        return this.balance;
    };
    return BankAccount;
}());
// Static Methods & Properties
var MathUtils = /** @class */ (function () {
    function MathUtils() {
    }
    MathUtils.square = function (x) {
        return x * x;
    };
    MathUtils.PI = 3.14;
    return MathUtils;
}());
// EXERCISES 
// Exercise 1 – Person Class
// Create a Person class with:
// 	•	name: string, age: number
// 	•	A method greet() that returns: "Hi, I'm NAME and I'm AGE years old."
var Person = /** @class */ (function () {
    function Person(name, age) {
        this.name = name;
        this.age = age;
    }
    Person.prototype.greet = function () {
        return "Hi I'm ".concat(this.name, " and I'm ").concat(this.age, " years old.");
    };
    // Add a static method isAdult(age: number): boolean to Person that returns true if age ≥ 18.
    Person.isAdult = function (age) {
        if (age >= 18) {
            return true;
        }
        else {
            return false;
        }
    };
    return Person;
}());
var eli = new Person('eli', 17);
console.log(eli.greet());
console.log(Person.isAdult(eli.age));
//  Exercise 2 – Inheritance
// Create a base class Vehicle with:
// 	•	speed: number
// 	•	Method drive() that logs "Driving at SPEED mph"
var Vehicle = /** @class */ (function () {
    function Vehicle(speed) {
        this.speed = speed;
    }
    Vehicle.prototype.drive = function () {
        console.log("Driving at ".concat(this.speed, " mph"));
    };
    return Vehicle;
}());
var v = new Vehicle(12);
console.log(v.drive());
// Subclass it into:
// 	•	Car, adding a brand and overriding drive() to say "Brand car driving at SPEED mph"
var Car = /** @class */ (function (_super) {
    __extends(Car, _super);
    function Car(speed, brand) {
        var _this = _super.call(this, speed) || this;
        _this.brand = brand;
        return _this;
    }
    Car.prototype.drive = function () {
        console.log("".concat(this.brand, " car driving at ").concat(this.speed, " mph"));
    };
    return Car;
}(Vehicle));
var c = new Car(12, 'honda');
console.log(c.drive());
// Exercise 3 – Access Modifiers
// Add a User class with:
// 	•	private _password: string
// 	•	public username: string
// 	•	Method checkPassword(p: string): boolean
var User = /** @class */ (function () {
    function User(password, username) {
        this._password = password;
        this.username = username;
    }
    User.prototype.checkPassword = function (p) {
        if (p == this._password) {
            return true;
        }
        else {
            return false;
        }
    };
    return User;
}());
var pass = new User('hey', 'em');
console.log(pass.checkPassword('hi'));
// Exercise 4 – readonly Fields
// Create a Book class with:
// 	•	readonly title: string
// 	•	author: string
//  • year: number
// 	•	Method summary() that returns "TITLE by AUTHOR"
var Book = /** @class */ (function () {
    function Book(title, author, year) {
        this.title = title;
        this.author = author;
        this.year = year;
    }
    Book.prototype.summary = function () {
        return "".concat(this.title, " by ").concat(this.author, " (").concat(this.year, ")");
    };
    return Book;
}());
var b = new Book('twilight', 'steph meyers', 2005);
console.log(b.summary());
// Exercise 5 – Static Methods
// Create a utility class Converter with a static method kmToMiles(km: number): number.
var utilConverter = /** @class */ (function () {
    function utilConverter() {
    }
    utilConverter.kmToMiles = function (km) {
        return km * 0.62;
    };
    return utilConverter;
}());
console.log(utilConverter.kmToMiles(12)); // ✅ call static method on class
var Circle = /** @class */ (function () {
    function Circle(radius) {
        this.radius = radius;
    }
    Circle.prototype.area = function () {
        return Math.PI * Math.pow(this.radius, 2);
    };
    return Circle;
}());
var Rectangle = /** @class */ (function () {
    function Rectangle(width, height) {
        this.width = width;
        this.height = height;
    }
    Rectangle.prototype.area = function () {
        return this.width * this.height;
    };
    return Rectangle;
}());
var circ = new Circle(3);
console.log('Circle area:', circ.area());
var r = new Rectangle(4, 5);
console.log('Rectangle area:', r.area());
