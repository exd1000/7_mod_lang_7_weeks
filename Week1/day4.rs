// variables 

let name = 'Alice'; // immutable 
let mut name = 32; // mutable 


// conditionals 

let score = 88;

if score >= 90 {
    println!("Top-tier"); // Rust requires double quotes not single (unless characters)
} else if score >= 75 {
    println!("Strong");
} else if score >= 50 {
    println!("Average");
} else {
    println!("Needs review");
}


// loops 

// for loop 

let cities = ["Tokyo","Paris", "NYC"];
for city in cities.iter() {
    println!("{city} is a major city.");
}

// while loop 

let mut count = 0;
while count < 3 {
    println!("Counting... {}",count);
    count += 1;
}


// loop (infinite unless break used) 

let mut x = 0;
loop {
    x += 1;
    if x == 5 {
        break;
    }
}

// match expression (Rust's switch but better)

let hour = 20;

match hour {
    6..=11 => println!("Morning"), // range patterns (..=)
    12..=15 => println!("Afternoon"),
    16..=19 => println!("Evening"),
    _ => println!("Night"),
}


/* Ex1: If/Else

Write a Rust program that checks a variable temperature and prints:
	•	Hot (>30°C)
	•	Warm (15–30°C)
	•	Cold (<15°C)
*/ 

let mut temp = 32;

if temp > 30 { 
    println!("Hot");
} else if 15 < temp <= 30 { 
    println!("Warm");
} else {
    println!("Cold");
}



/* 
❌ Issue: 15 < temp <= 30 isn’t valid Rust syntax.
You need to use explicit comparisons:


} else if temp > 15 && temp <= 30 {

✅ With that change, it’s perfect.
*/



/* Ex2: Match Hour

Create a match statement on an hour variable (0–23) that prints:
	•	“Morning” (6–11)
	•	“Afternoon” (12–15)
	•	“Evening” (16–19)
	•	“Night” (everything else)
*/ 

let hour = 12; 

match hour {
    6..=11 => println!("Morning"),
    12..=15 => println!("Afternoon"),
    16..=19 => println!("Evening"),
    _ => println!("Night"),
}

/* Ex3: Loop Over Cities

Given Print:
"Tokyo is a major city.", etc.
*/ 

let cities = ["Tokyo", "Paris", "New York"];

for city in cities.iter() { 
    println!("{city} is a major city");
}


/* 
✔️ Clean and correct!
💡 You can also use .iter() with .for_each() in Rust’s 
functional style, but your version is idiomatic and perfect.
*/ 



/* Ex4: Score Classification

Use if or match to print for each:
	•	90+: “Top-tier”
	•	75–89: “Strong”
	•	50–74: “Average”
	•	Below 50: “Needs review”
*/ 

let scores = [88, 74, 95, 67, 40];

for score in scores.iter() { 
    if score >= 90 {
        println!("Top-tier");
    } else if score >= 75 {
        println!("Strong");
    } else if score >= 50 {
        println!("Average");
    } else {
        println!("Needs review");
    }
}



/* 
✔️ Excellent. Clear, readable, and functional.

✅ You could turn this into a fn classify(score: i32)
 -> &str, but we’ll get to that in Week 2.
 */ 




/* Ex5: Dictionary Loop Challenge

Rust doesn’t have native dicts like Python, but we can use a HashMap.
Loop through the map and print:
Alice: Strong
Bob: Average
Charlie: Top-tier
Diana: Needs review
*/ 

// use std::collections::HashMap;

// let mut results = HashMap::new();
// results.insert("Alice", 89);
// results.insert("Bob", 56);
// results.insert("Charlie", 92);
// results.insert("Diana", 33);

// for (key,value) in &results {
//     if let Some(value) = results.get("value") {
//         for value in results.iter() { 
//             if value >= 90 {
//                 println!("Top-tier");
//             } else if value >= 75 {
//                 println!("Strong");
//             } else if value >= 50 {
//                 println!("Average");
//             } else {
//                 println!("Needs review");
//             }
//         }
//     }
// }

/* 
    💥 This has a few issues:
	•	You’re already iterating with for (key, value), so you don’t need get() 
    or a second loop
	•	"value" is a literal string, not your actual value
	•	The second loop is invalid


🔧 Clean, working solution: */ 


use std::collections::HashMap;

let mut results = HashMap::new();
results.insert("Alice", 89);
results.insert("Bob", 56);
results.insert("Charlie", 92);
results.insert("Diana", 33);

for (name, score) in &results {
    let grade = if *score >= 90 {
        "Top-tier"
    } else if *score >= 75 {
        "Strong"
    } else if *score >= 50 {
        "Average"
    } else {
        "Needs review"
    };
    println!("{name}: {grade}");
}
