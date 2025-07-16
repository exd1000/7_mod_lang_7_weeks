// variables, conditionals, loops


// variables
let name: string = 'Alice';
const age: number = 32;
let hasData: boolean = true; 

// let: mutable variable 
// const: can't be reassigned 
// type inference works but explicit typing great for clarity 


// conditionals 
if (age > 30) {
    console.log('Experienced');
}   else if (age > 20) {
    console.log('On the way');
}   else {
    console.log('Just starting');
}

// ternary
const message = hasData ? 'Yes' : 'No';

// switch statement
const status = 'pending';
switch (status) {
    case 'success':
        console.log('Done');
        break;
    case 'pending':
        console.log('Waiting...');
        break;
    default:
        console.log('Unknown');
}

// loops

// for loop
for (let i = 0; i < 3; i++) {
    console.log('Looping', i);
}

// forEach
const cities = ['Tokyo','Paris','NYC'];
cities.forEach((city) => {
    console.log(`${city} is a major city.`);
});

// map
const lengths = cities.map((city) => city.length);


// real world example
const scores = [88,95,74,60,45];

scores.forEach(score => {
    if (score >= 85) {
        console.log(`${score}: Excellent`);
    }   else if (score >= 60) {
        console.log(`${score}: Good`);
    }   else {
        console.log(`${score}: Needs Improvement`);
    }
});


/* Ex1: Basic If/Else

 Write a script that uses a variable temperature and logs 
 if it’s hot (>30°C), warm (15–30°C), or cold (<15°C). */

 let temp: number = 40 

 if (temp > 30) {
    console.log('Hot');
 }  else if (temp >= 15) & (temp <=30) {
    console.log('Warm');
 }  else {
    console.log('Cold');
 }



/* 
& is a bitwise operator in JavaScript/TypeScript. You want && for logical AND.
else if (temp >= 15 && temp <= 30) 

*/ 





 /* Ex2: Multi-Condition

Create a variable hour (0–23). 
Log “Morning”, “Afternoon”, “Evening”, or “Night”. */

let hour: number = 12

if (hour >= 6) & (hour <= 11) {
    console.log('Morning');
}   else if (hour = 12) & (hour >= 15) {
    console.log('Afternoon');
}   else if (hour >= 16) & (hour <= 19) {
    console.log('Evening');
    else {
    console.log('Night');
}



/* 	
& should be &&
hour = 12 is assignment, not comparison → should be hour === 12
Also, hour >= 15 contradicts hour === 12 — this condition is logically impossible

if (hour >= 6 && hour <= 11) {
  console.log('Morning');
} else if (hour >= 12 && hour <= 15) {
  console.log('Afternoon');
} else if (hour >= 16 && hour <= 19) {
  console.log('Evening');
} else {
  console.log('Night');
}

*/




/* Ex3: Looping Through Data

Given: Loop through and log:
"Tokyo is a major city.", and so on. */

const cities = ["Tokyo", "Paris", "New York"];

cities.forEach((city) => {
    console.log(`${city} is a major city.`);
});


/* 
Simple, idiomatic, works beautifully.

*/





/* Ex4: Data Classification

Given 
Log:
90+: “Top-tier”
75–89: “Strong”
50–74: “Average”
Below 50: “Needs review” */ 

const researchScores = [88, 74, 95, 67, 40];

researchScores.forEach((score) => {
    if (score >= 90) {
        console.log('Top-tier');
    }   else if (score >= 75) & (score <= 89) {
        console.log('Strong');
    }   else if (score >= 50) & (score <= 74) {
        console.log('Average');
    }   else {
        console.log('Needs review');
    }
});


/* 
✅ Correct structure
❌ Syntax fix needed: Use && instead of &

else if (score >= 75 && score <= 89)
Or even more idiomatically:
else if (score >= 75)
Since you’ve already eliminated score >= 90, there’s no need to recheck the upper bound.

*/ 






/* Ex5: Open-Ended Challenge

Given Log a report like:
Alice: Strong
Bob: Average
Charlie: Top-tier
Diana: Needs review */ 

const testResults = {
    Alice: 89,
    Bob: 56,
    Charlie: 92,
    Diana: 33
  };


// researchScores.forEach((score) => {
// if (score >= 90) {
//     console.log('Top-tier');
// }   else if (score >= 75) & (score <= 89) {
//     console.log('Strong');
// }   else if (score >= 50) & (score <= 74) {
//     console.log('Average');
// }   else {
//     console.log('Needs review');
// }
// });

// testResults.keys(name).forEach((name) => {
//     console.log(`${name}:${score}`);
// })


/* 
You wrote two loops, but used researchScores.forEach(...) again 
instead of looping over testResults. Also testResults.keys(name)
is not valid — Object.keys() is the method you want.

*/ 


Object.entries(testResults).forEach(([name, score]) => {
    if (score >= 90) {
      console.log(`${name}: Top-tier`);
    } else if (score >= 75) {
      console.log(`${name}: Strong`);
    } else if (score >= 50) {
      console.log(`${name}: Average`);
    } else {
      console.log(`${name}: Needs review`);
    }
  });

/* 
💡 Tips Going Forward
	•	Use && instead of & for conditionals
	•	Use === instead of = for comparisons
	•	Prefer Object.entries() when looping through objects
	•	Consider creating reusable functions like:
    function classify(score: number): string {
  // return "Strong", etc
}


*/ 