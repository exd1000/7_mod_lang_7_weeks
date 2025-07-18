// // Basic try/catch
// function toInt(value: string): number | null {
//   try {
//     return parseInt(value);
//   } catch (e) {
//     console.error("Failed to parse:", e);
//     return null;
//   }
// }

// // Custom Error Class
// class InvalidEmailError extends Error {
//   constructor(msg: string) {
//     super(msg);
//     this.name = "InvalidEmailError";
//   }
// }

// function validateEmail(email: string): boolean {
//   if (!email.includes("@")) {
//     throw new InvalidEmailError("Email must contain '@'");
//   }
//   return true;
// }


// // Writing Jest Tests
// // Run with: npx jest
// // calculator.ts
// export class Calculator {
//   add(a: number, b: number) { return a + b }
//   div(a: number, b: number) {
//     if (b === 0) throw new Error("Division by zero")
//     return a / b
//   }
// }

// // calculator.test.ts
// import { Calculator } from "./calculator"

// test("adds numbers", () => {
//   const calc = new Calculator();
//   expect(calc.add(2, 3)).toBe(5);
// });

// test("throws on division by zero", () => {
//   const calc = new Calculator();
//   expect(() => calc.div(10, 0)).toThrow("Division by zero");
// });



// Hints & Setup Notes
// To run the Jest tests:
// 	1.	Install dependencies:
//             npm install --save-dev jest ts-jest @types/jest
//             npx ts-jest config:init
//     2.	Add this to your package.json:
//             "scripts": {
//             "test": "jest"
//             }
//     3.	Run with:
//         npm test



// Exercise 1 – String to Int Conversion (Safe)
// Write a function safeParseInt(value: string): number | null 
// that tries to parse an integer from a string and returns null if it fails.
    // Example:
    // safeParseInt("42")      // → 42
    // safeParseInt("oops")    // → null

// Use try/catch and log the error using console.error.

function safeParseInt(value: string): number | null {
  const result = parseInt(value);
  if (isNaN(result)) {
    console.error('Failed parsing', value);
    return null;
  }
  return result;

}  

// ⚠️ Issue:
// parseInt() doesn’t actually throw on invalid input — it returns NaN.
//   try {
//     return parseInt(value);
//   } catch (e) {
//     console.error('Failed parsing', e);
//     return null;
//   }





// Exercise 2 – Custom Error for Email Validation
// Create a custom error class InvalidEmailError and a function 
// checkEmail(email: string) that throws it if the email is missing '@'.

    // // Example:
    // checkEmail("test@example.com")   // ✅ true
    // checkEmail("brokenemail.com")    // ❌ throws InvalidEmailError
// Log all invalid emails with console.warn.

class InvalidEmailError extends Error {
  constructor(msg: string) {
    super(msg);
    this.name = 'InvalidEmailError';
  }
}

function checkEmail(email: string): boolean {
  if (!email.includes('@')) {
    console.warn("Invalid email provided:", email); // forgot to add console.warn whoops
    throw new InvalidEmailError('Email must contain @');
  }
  return true;
}


// Exercise 3 – Float Conversion with Logging
// Write a function convertToFloats(values: string[]): number[]
// This should:
// 	•	Try to convert each string to a float
// 	•	Log any invalid string with console.warn
// 	•	Return only the valid float values

function convertToFloats(values: string[]): number[] {
  const results: number[] = [];
  for (const v of values) {
    const num = parseFloat(v);
    if (isNaN(num)) {
      console.warn(`Invalid float: ${v}`);
    } else {
      results.push(num);
    }
  }
  return results;
}


// ❌ Incorrect implementation:
// 	•	parseFloat() doesn’t take an array — it’s for single strings.
// 	•	try/catch block isn’t appropriate for the whole array.
// 	•	return number[] is a syntax error.
//   try {
//     return parseFloat(values);
//   } catch (e) {
//     console.warn('Invalid string')
//     return number[];
//   }

// Exercise 4 – Simulated API Request
// Create a function fetchUserData() that fetches from an invalid URL 
//     (e.g., https://bad.api.fake/user).
// Handle and log the error using try/catch, fetch, and console.error.
// Use node-fetch or the fetch API available in modern environments.


async function fetchUserData(request: string): Promise<void> {
  try {
    const response = await fetch(request);
    if (!response.ok) throw new Error(`HTTP error. Status: ${response.status}`);
    const data = await response.json();
    console.log(data);
  } catch (e) {
    console.error('Request failed:',e);
  }
}

// ❌ Bugs:
// 	•	url is not a type — should be string
// 	•	fetch() is asynchronous — you need async/await
// 	•	You should also await response.json() if testing further

// function fetchUserData(request: url) {
//   try {
//     return fetch(request);
//   } catch (e) {
//     console.error('Invalid request',e);
//   }
// }


// Exercise 5 – Jest Test Suite for a Calculator
// Create a simple Calculator class with methods:
// 	•	add(a, b)
// 	•	subtract(a, b)
// 	•	multiply(a, b)
// 	•	divide(a, b) → Throws error if b === 0
// Then write a calculator.test.ts file that includes:
// 	•	✅ Normal test cases (add, subtract, etc.)
// 	•	❌ At least one test that checks error on divide-by-zero




import {Calculator} from './calculator'

test('adding', () => {
  const calc = new Calculator();
  expect(calc.add(2,3)).toBe(5);
});

test('subtracting', () => {
  const calc = new Calculator();
  expect(calc.subtract(5,3)).toBe(2);
});

test('multipling', () => {
  const calc = new Calculator();
  expect(calc.multiply(5,3)).toBe(15);
});


test('zero division', () => {
  const calc = new Calculator();
  expect(() => calc.divide(5,0)).toThrow('Zero division');
});