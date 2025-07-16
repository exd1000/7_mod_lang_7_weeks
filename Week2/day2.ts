/* 
arrays (like python lists) > type-safe, 
iterated with for,forEach,map, etc.
*/

const langs: string[] = ['Python','Rust','Go'];
langs.push('Julia');

/* objects (like python dicts) > key-value pairs,
best for simple mappings
*/

// const tools = {
//     'VS Code':'Editor',
//     'ChatGPT':'Assistant'
// };
// console.log(tools['VS Code']);


/* 
Map<K,V> 
more powerful than object, keeps order
keys can be any type not just strings
*/

// const scores = new Map<string,number>();
// scores.set('Alice',88)
// scores.set('Bob',72);

/* 
Set<T>
unique values, automatically removes duplicates,
fast .has() 
*/

// const tags = new Set(['python','ai','data','python']);
// tags.add('research');




/*
Ex1: Arrays

Create an array of your 4 favorite libraries or frameworks. Then:
	•	Print the first and last item
	•	Add one more
	•	Remove one using .splice() or .pop()
*/


const frames: string[] = ['Dynamical Systems','Quantum Mechanics','Philosophy','CogSci']
console.log(frames[0],frames[3]);
frames.push('Psychology');



/*
💡 For removal: you didn’t include it, but you could do:
frames.pop(); // OR
frames.splice(2, 1); // remove third item
*/




/*
Ex2: Object lookup
Create an object mapping tools to roles. 
Loop through and print "Tool is for Role"
*/

const tools = {
    "Notion": "Notes",
    "Figma": "Design",
    "Python": "Programming"
  }

console.log(tools['Notion']);

Object.entries(tools).forEach(([tool,role]) => {
   console.log(`${tool} is for ${role}`);
});



/* 
Ex3: Set cleanup
Create a list of duplicate tags
Convert it to a Set and print the unique values.
*/

const tags = new Set(["python", "ai", "data", "python", "ai"]);
console.log(tags);




/* 
Ex4: Use a map
Create a Map<string, number> of student scores (at least 3).
Loop through and classify using this logic:
	•	90+: “Top-tier”
	•	75–89: “Strong”
	•	50–74: “Average”
	•	Below 50: “Needs review”

Print: Name: Rating
*/

const scores = new Map<string,number>();
scores.set('Alice',88);
scores.set('Bob',72);
scores.set('Janet',48);

// Object.entries(scores).forEach(([name,score]) => {
//     if (score >= 90) {
//         console.log(`${name}: Top-tier`);
//       } else if (score >= 75) {
//         console.log(`${name}: Strong`);
//       } else if (score >= 50) {
//         console.log(`${name}: Average`);
//       } else {
//         console.log(`${name}: Needs review`);
//       }
// });



/*
❌ Issue: Map isn’t a plain object — Object.entries() doesn’t work on Map.
🔧 Fix: use .forEach() on the Map directly:
*/ 

scores.forEach((score, name) => {
    let grade = "";
    if (score >= 90) grade = "Top-tier";
    else if (score >= 75) grade = "Strong";
    else if (score >= 50) grade = "Average";
    else grade = "Needs review";
  
    console.log(`${name}: ${grade}`);
  });






/* 
Ex 5: Nested objects 
Create an object Loop through and print:
Alice (CS): Strong
Bob (Bio): Average
*/

const students = {
    Alice: { score: 89, major: "CS" },
    Bob: { score: 56, major: "Bio" }
  }


Object.entries(students).forEach(([student,info])=> {
    const major = info['major'];
    const grade = info['score'];

    if (grade >= 90) {
        console.log(`${student} (${major}): Top-tier`);
      } else if (grade >= 75) {
        console.log(`${student} (${major}): Strong`);
      } else if (grade >= 50) {
        console.log(`${student} (${major}): Average`);
      } else {
        console.log(`${student} (${major}): Needs review`);
      }
});
