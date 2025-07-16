use std::fs;
use std::io::Write;
use serde::{Deserialize, Serialize};

fn main() -> Result<(), Box<dyn std::error::Error>> {
// 🛠️ Setup
// Make sure you’re using a recent Rust toolchain:

//     cargo new file_io_day
//     cd file_io_day

// Add this to your Cargo.toml:
//     [dependencies]
//     serde = { version = "1.0", features = ["derive"] }
//     serde_json = "1.0"




    // Read from a File
        // use std::fs;

    let content = fs::read_to_string("fields.txt")?;
    println!("{}", content);

    // Write to a File
    fs::write("tools.txt", "Rust is fast!\n")?;


    // Append to a File
        // use std::io::Write;

    // let mut file = fs::OpenOptions::new()
    //     .append(true)
    //     .create(true)
    //     .open("ideas.txt")?;

    // writeln!(file, "New idea here")?;

    // Read JSON with Serde
        // use serde::{Deserialize, Serialize};

    // #[derive(Serialize, Deserialize)]
    // struct Student {
    //     name: String,
    //     score: u32,
    //     major: String,
    // }

    // let s = Student {
    //     name: "Alice".to_string(),
    //     score: 89,
    //     major: "CS".to_string(),
    // };

    // let json = serde_json::to_string_pretty(&s)?;
    // fs::write("student.json", json)?;




    // Exercise 1: Read from File
    // Create a fields.txt file with:
    //     AI
    //     Cognitive Science
    //     Data Science
    //     Philosophy
    // Read and print each line as Field: AI.

    let field = fs::read_to_string("fields.txt")?;
    println!("{}",field);


// 💡 Bonus idea:
        for line in field.lines() {
        println!("Field: {}", line);
    }
    // Exercise 2: Write Dictionary to File
    // Write each line to tools.txt:
    //     VS Code is an Editor    

        let tools = vec![
        ("VS Code", "Editor"),
        ("Python", "Language"),
        ("Notion", "Notes")
    ];

    let mut lines = String::new(); 
    for (tool,role) in tools {
        lines.push_str(&format!("{} is a {}.\n", tool, role));
    }
    fs::write("tools.txt",lines)?;

    let tool = fs::read_to_string("tools.txt")?;
    println!("{}",tool);

    // Exercise 3: Append User Input
    // Prompt for a research idea using std::io, then append it to ideas.txt.

    let mut file = fs::OpenOptions::new()
        .append(true)
        .create(true)
        .open("ideas.txt")?;
    
    writeln!(file, "New idea here")?;


    // 🧠 Bonus challenge: accept user input via std::io::stdin() for future realism.


    // Exercise 4: JSON Handling
    // Define a Student struct, write one to student.json, then read it


   #[derive(Serialize, Deserialize)]
    struct Student {
        name: String,
        score: u32,
        major: String,
    }

    let s = Student {
        name: "Alice".to_string(),
        score: 89,
        major: "CS".to_string(),
    };

    let json = serde_json::to_string_pretty(&s)?;
    fs::write("student.json", json)?;

    // fs::read_to_string("student.json")?;


// ⚠️ Small fix: You’re reading the JSON file but not deserializing it back into a struct.
    let raw = fs::read_to_string("student.json")?;
    let student_back: Student = serde_json::from_str(&raw)?;
    println!("{} scored {}", student_back.name, student_back.score);



    // Exercise 5: Filtered File
    // Write a file scores.txt with:
    //     92
    //     45
    //     88
    //     51
    //     33
    // Read it and print only scores ≥ 50.


    let scores = [92, 45, 88,51, 33];
    let mut file = fs::File::create("scores.txt")?;

    for score in scores.iter() {
        writeln!(file, "{}", score)?;
    }

    let s = fs::read_to_string("scores.txt")?;

    for line in s.lines() {
        if let Ok(num) = line.parse::<i32>() {
            if num >= 50 {
                println!("{}",num);
            }
        }
    }

Ok(())


}