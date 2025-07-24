// Week 5 – Day 4: Rust – Object-Oriented Design via Structs & Traits

// Class - struct + impl
// Constructor - fn new() in impl block
// Method - fn method(&self)
// Method overloading - Trait-based polymorphism
// Static method - fn method(), no self
// Inheritance - Traits + impl Trait for Struct
// Encapsulation - pub / private fields
// Polymorphism - Trait objects & generics
// Access Modifiers - pub, private by default


// Struct + Method
struct Person {
    name: String,
    age: u8,
}

impl Person {
    fn new(name: &str, age: u8) -> Self {
        Self {
            name: name.to_string(),
            age,
        }
    }

    fn greet(&self) -> String {
        format!("Hi, I'm {} and I'm {} years old.", self.name, self.age)
    }

    fn is_adult(&self) -> bool {
        self.age >= 18
    }
}

// Traits = Interfaces
trait Speak {
    fn speak(&self) -> String;
}

struct Dog;

impl Speak for Dog {
    fn speak(&self) -> String {
        "Woof!".to_string()
    }
}

trait Vehicle {
    fn drive(&self) -> String;
}

struct Car {
    brand: String,
    speed: u32,
}

struct Bike {
    kind: String,
    speed: u32,
}

impl Vehicle for Car {
    fn drive(&self) -> String {
        format!("{} car driving at {} mph", self.brand, self.speed)
    }
}

impl Vehicle for Bike {
    fn drive(&self) -> String {
        format!("{} bike pedaling at {} mph", self.kind, self.speed)
    }
}

// Private Fields + Associated Functions
struct User {
    username: String,
    password: String, // private by default
}

impl User {
    fn new(username: &str, password: &str) -> Self {
        User {
            username: username.into(),
            password: password.into(),
        }
    }

    fn check_password(&self, input: &str) -> bool {
        self.password == input
    }
}


// Trait + Default Implementation
trait Shape {
    fn area(&self) -> f64;
    fn describe(&self) {
        println!("I'm a shape.");
    }
}

struct Circle {
    radius: f64,
}

struct Rectangle {
    width: f64,
    height: f64,
}

impl Shape for Circle {
    fn area(&self) -> f64 {
        std::f64::consts::PI * self.radius.powi(2)
    }
}

impl Shape for Rectangle {
    fn area(&self) -> f64 {
        self.width * self.height
    }
}

// Trait Object + Dynamic Dispatch
fn print_area(shape: &dyn Shape) {
    shape.describe();
    println!("Area: {}", shape.area());
}


fn main() {
    let p = Person {
        name: "Eli".to_string(),
        age: 17,
    };
    println!("{}", p.greet());
    println!("Adult? {}", p.is_adult());

    let honda = Car { brand: "Honda".into(), speed: 60 };
    let fixie = Bike { kind: "Fixie".into(), speed: 15 };

    println!("{}", honda.drive());
    println!("{}", fixie.drive());

    let u = User::new("em", "hi");
    println!("Password match? {}", u.check_password("hi"));

    let c = Circle { radius: 3.0 };
    let r = Rectangle { width: 4.0, height: 5.0 };

    c.describe();
    println!("Circle area: {}", c.area());

    r.describe();
    println!("Rectangle area: {}", r.area());

    let shapes: Vec<Box<dyn Shape>> = vec![
        Box::new(Circle { radius: 2.0 }),
        Box::new(Rectangle { width: 3.0, height: 4.0 }),
    ];

    for shape in shapes.iter() {
        print_area(&**shape);
    }
}


// EXERCISES
Exercise 1 – Person Struct
Create a Person struct with:
	•	name: String, age: u8
	•	A method greet() that returns "Hi, I'm NAME and I'm AGE years old."

Exercise 2 – Constructor
Add a new(name: &str, age: u8) -> Self constructor to Person

Exercise 3 – Trait Implementation
Create a Greetable trait with a greet() method.
Implement it for Person, Robot, and Alien.

Exercise 4 – Encapsulation
Make a User struct with:
	•	username: String
	•	password: String (private)
	•	check_password(p: &str) -> bool method

Exercise 5 – Polymorphism
Write a function say_hello() that takes a &dyn Greetable and prints their greet() output.
Use it on Person, Robot, and Alien.