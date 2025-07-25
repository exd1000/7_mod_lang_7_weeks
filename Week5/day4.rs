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


fn examples() {
// Structs + traits + polymorphism
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

// Private Fields + Associated Functions
    let u = User::new("em", "hi");
    println!("Password match? {}", u.check_password("hi"));

// Trait + Default Implementation
    let c = Circle { radius: 3.0 };
    let r = Rectangle { width: 4.0, height: 5.0 };

    c.describe();
    println!("Circle area: {}", c.area());

    r.describe();
    println!("Rectangle area: {}", r.area());

// Trait Object + Dynamic Dispatch
// Use trait objects (Box<dyn Trait>) for runtime polymorphism.
    let shapes: Vec<Box<dyn Shape>> = vec![
        Box::new(Circle { radius: 2.0 }),
        Box::new(Rectangle { width: 3.0, height: 4.0 }),
    ];

    for shape in shapes.iter() {
        print_area(&**shape);
    }
}


// EXERCISES

// Exercise 1 – Human Struct
// Create a Human struct with:
// 	•	name: String, age: u8
// 	•	A method greet() that returns "Hi, I'm NAME and I'm AGE years old."

struct Human {
    name: String,
    age: u8,
}

struct Robot {
    name: String, 
}

struct Alien {
    name: String,
}


// fn greet(&self) -> String {
//     format!("Hi I'm {} and I'm {} years old", self.name, self.age)
// }

// ❌ fn greet(&self) outside of impl or trait
// Error: self parameter only allowed in associated functions`



// Exercise 2 – Constructor
// Add a new(name: &str, age: u8) -> Self constructor to Human

impl Human {
    fn new(name: &str, age: u8) -> Self {
        Self {
            name: name.to_string(),
            age,
        }
    }
}

impl Robot {
    fn new(name: &str) -> Self {
        Self {
            name: name.to_string(),
        }
    }
}

impl Alien {
    fn new(name: &str) -> Self {
        Self {
            name: name.to_string(),
        }
    }
}


// Exercise 3 – Trait Implementation
// Create a Greetable trait with a greet() method.
// Implement it for Human, Robot, and Alien.

trait Greetable {
    fn greet(&self) -> String;
}

impl Greetable for Human {
    fn greet(&self) -> String {
        format!("Hi I'm {} and I'm {} years old", self.name, self.age)
    }
}

impl Greetable for Robot {
    fn greet(&self) -> String {
        format!("I'm {}. Nice to meet you.", self.name)
    }
}

impl Greetable for Alien {
    fn greet(&self) -> String {
        format!("I'm {}. I'm from space.", self.name)
    }
}



// Exercise 4 – Encapsulation
// Make a User1 struct with:
// 	•	username: String
// 	•	password: String (private)
// 	•	check_password(p: &str) -> bool method

struct User1 {
    username: String, 
    password: String, 
}

impl User1 {
    fn new(username: &str, password: &str) -> Self {
        User1 {
            username: username.into(),
            password: password.into(),
        }
    }

    fn check_password(&self, p: &str) -> bool {
        self.password == p
    }
}





// Exercise 5 – Polymorphism
// Write a function say_hello() that takes a &dyn Greetable and prints their greet() output.
// Use it on Person, Robot, and Alien.
fn say_hello(s: &dyn Greetable) {
    println!("{}", s.greet());
    // ❌ Error: format argument must be a string literal
    // Add "{}" to println! for s.greet()
    // println!(s.greet()); 
}





fn exercises() {
// Exercise 3
    let em = Human {name: "Em".into(), age: 12};
    let ro = Robot {name: "Wall-e".into()};
    let ali = Alien {name: "Ali".into()};

    println!("{}",em.greet());
    println!("{}",ro.greet());
    println!("{}",ali.greet());

// Exercise 4 
    let pass = User1::new("em", "hi");
    println!("match pw? {}", pass.check_password("hey"));
    
// Exercise 5
    let x: Vec<Box<dyn Greetable>> = vec![
    Box::new(Human { name: "el".to_string(), age: 14 }),
    Box::new(Robot { name: "roro".to_string() }),
    Box::new(Alien { name: "alex".to_string() }),
    ];

    // ❌ expected String, found &str
    // Rust is strict with type matching, and String ≠ &str unless you convert explicitly.
    // Fix: Wrap the name fields in .to_string():

    // Box::new(Human {name: "el", age: 14}),
    // Box::new(Robot {name: "roro"}),
    // Box::new(Alien {name: "alex"}),


    for s in x.iter() {
        say_hello(&**s);
    }

}


fn main() {
    examples();
    exercises();
}