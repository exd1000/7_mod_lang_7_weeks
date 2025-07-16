fn main () {	
	// Vec<T> – Growable List (like Python list)

	let mut langs = vec!["Rust", "Go", "Python"];
	langs.push("Julia");
	println!("{}", langs[0]);


	// Tuples – Fixed-size group
	let location = (40.7128, -74.0060);
	println!("Lat: {}, Lon: {}", location.0, location.1);


	// HashMap<K, V> – Key-Value Store
	use std::collections::HashMap;

	let mut tools = HashMap::new();
	tools.insert("VS Code", "Editor");
	tools.insert("Python", "Language");



	// Use .get() to access:
	if let Some(role) = tools.get("VS Code") {
		println!("VS Code is an {}", role);
	}


	// HashSet<T> – Unique values
	use std::collections::HashSet;

	let mut tags = HashSet::new();
	tags.insert("python");
	tags.insert("ai");
	tags.insert("python"); // only stored once



/* 
Exercise 1: Vectors

Create a Vec<String> of your top 4 favorite frameworks. Then:
	•	Print the first and last
	•	Add one
	•	Remove one using .remove()
*/


	let mut frameworks = vec!["QuantumMechs","DynamicalSyst","CogSci","Python"];
	println!("{},{}",frameworks[0],frameworks[3]);
	frameworks.push("GraphTheory");
	frameworks.remove(3);
	println!("{:?}",frameworks);




	// 💡 Could use .last() to print the last element more safely, but indexing is fine here.



/* 
Exercise 2: Tuples

Create a (f64, f64) tuple called coordinates and print each value.
*/

	// let coordinates = ("f64", "f64");
	// println!("{},{}", coordinates.0,coordinates.1);



// ❌ You’ve created a tuple of strings, not f64.

	let coordinates: (f64, f64) = (40.7128, -74.0060);
	println!("{}, {}", coordinates.0, coordinates.1);


/* 
Exercise 3: HashMap Lookup

Create a HashMap<&str, &str> mapping tools to roles.
Loop through it and print:
Tool is for Role
*/



	let mut new_tools = HashMap::new();
	new_tools.insert("VS Code", "editor");
	new_tools.insert("Python","language");



	for (tool,role) in new_tools.iter() {
			println!("{tool} is for {role}");
		}
	

/* 
Exercise 4: HashSet Cleanup

Create a list of repeated tags, turn them into a HashSet, and print the unique values.
*/


	let mut repeated_tags = HashSet::new(); 
	repeated_tags.insert("python");
	repeated_tags.insert("ai");
	repeated_tags.insert("python");
	repeated_tags.insert("rust");

	println!("{:?}",repeated_tags);


/* 
Exercise 5: Student Scoring with HashMap

Create data given. Loop through and print:
Name: Rating
Grading logic:
	•	90+: “Top-tier”
	•	75–89: “Strong”
	•	50–74: “Average”
	•	Below 50: “Needs review”

*/


	let mut students = HashMap::new();
	students.insert("Alice", 89);
	students.insert("Bob", 56);
	students.insert("Charlie", 92);
	students.insert("Diana", 33);



	for (name, score) in students {
		let rating = if score >= 90 {
			"Top-tier"
		} else if score >=75 {
			"Strong"
		} else if score >=50 {
			"Average"
		} else {
			"Needs review"
		};
		println!("{name}: {rating}");
	}
}