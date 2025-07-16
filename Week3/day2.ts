import * as fs from 'fs';
import * as readlineSync from 'readline-sync';



// 1. Read a File
// const content = fs.readFileSync('file.txt', 'utf8');
// console.log(content);

// 2. Write to a File
// fs.writeFileSync('output.txt', 'Hello, file!');

// 3. Append to a File
// fs.appendFileSync('log.txt', 'New entry\n');

// 4. JSON Handling
// const student = { name: "Alice", score: 88 };
// fs.writeFileSync('student.json', JSON.stringify(student, null, 2));

// const data = JSON.parse(fs.readFileSync('student.json', 'utf8'));
// console.log(data.name);


// Exercise 1: Read From File
// Create a fields.txt file with:
//     AI
//     Cognitive Science
//     Data Science
//     Philosophy
// Write a TypeScript script that:
// 	•	Reads each line
// 	•	Logs: Field: AI, etc.

const content = fs.readFileSync('fields.txt','utf8');
console.log(`Logs: ${content}`);



// 🔧 Optional tweak: log each line with "Field: ":
// content.split('\n').forEach(line => console.log(`Field: ${line}`));



// Exercise 2: Write Dictionary
// Create a dictionary of tools
// Write to tools.txt like:
//     VS Code is an Editor
//     Python is a Language

const tools = {
  "VS Code": "Editor",
  "Python": "Language",
  "Notion": "Notes"
}

// ✅ Fix: Accumulate and write once:
let line = Object.entries(tools).map(([tool, role]) => `${tool} is for ${role}.`).join('\n');
fs.writeFileSync('tools.txt', line);
// ✅ Read and print after writing:
console.log(fs.readFileSync('tools.txt', 'utf8'));

// Object.entries(tools).forEach(([tool,role]) => {
//     fs.writeFileSync('tools.txt',`${tool} is for ${role}.`);
//     const stuff = fs.readFileSync('tools.txt','utf8');
//     console.log(stuff);
// })

// ⚠️ fs.writeFileSync() inside the loop overwrites the file every time, so only the last tool remains.




// Exercise 3: Append User Input
// Use readline-sync or prompt-sync to get input:
//     npm install readline-sync
// Append the input to ideas.txt.

const input = readlineSync.question('What ideas do you have? ');
fs.appendFileSync('log.txt',`${input}\n`);



// Exercise 4: JSON File Handling
// Write and read a student.json file:
const student1 = { name: "Alice", score: 89, major: "CS"};

fs.writeFileSync('student1.json', JSON.stringify(student1, null,2));
const data = JSON.parse(fs.readFileSync('student1.json', 'utf8'));
console.log(data.name);


// Exercise 5: Open File → Filter Data
// Create scores.txt
//     92
//     45
//     88
//     51
//     33
// Filter and print only scores ≥ 50.



const raw_score = fs.readFileSync('scores.txt', 'utf8');
const lines = raw_score.trim().split('\n'); // split by line 
const score = lines.map(line => parseInt(line));
score.forEach(score => {
    if (score >= 50) {
    console.log(score);
    }
});


// 🧠 Bonus: use .filter() to simplify:
// score.filter(s => s >= 50).forEach(s => console.log(s));
