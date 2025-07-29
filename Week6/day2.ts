// Week 6 – Day 2: TypeScript – Async, Promises, & Concurrency Patterns 🚀

// TypeScript runs on JavaScript’s event loop, 
// so its concurrency model is asynchronous and single-threaded—but non-blocking thanks to:
// 	•	async/await – Clean syntax for working with Promises.
// 	•	Promises – Objects representing the eventual result of an async operation.
// 	•	Concurrency – Running async tasks “at the same time” (non-blocking).
// 	•	Promise.all() – Wait for multiple promises concurrently.
// 	•	setTimeout, setInterval – Basic delay-based async tools.
// 	•	Error handling – try/catch in async/await flows.
//     •	the event loop – microtasks/macrotasks
// 	•	Web APIs – setTimeout, fetch, etc.
// 	•	Workers – for multi-threading via Web Workers

// This day focuses on how TypeScript/JS handles asynchronous logic, concurrency, 
// and performance profiling—not traditional multithreading.


// Promise-Based Async Flow
const wait = (ms: number) => new Promise(resolve => setTimeout(resolve, ms));

wait(1000).then(() => console.log('Done waiting!'));

// Async/Await
async function greet() {
  console.log("Hello");
  await wait(1000);
  console.log("Goodbye");
}
greet();

// Async Function with Await
async function waitAndPrint(msg: string, delay: number) {
  await new Promise(resolve => setTimeout(resolve, delay));
  console.log(msg);
}

await waitAndPrint("Hello", 1000);  // prints after 1 second

// Concurrent Promises with Promise.all()
const fetchData = (name: string, delay: number) =>
  new Promise<string>(resolve =>
    setTimeout(() => resolve(`Data from ${name}`), delay)
  );

const main = async () => {
  const results = await Promise.all([
    fetchData("Em", 1000),
    fetchData("Benji", 2000),
    fetchData("Elias", 1500)
  ]);
  console.log(results);  // all results together
};

await main();


// Concurrency Control
// Simple concurrency control using a queue or manual limiting
async function withLimit(tasks: (() => Promise<any>)[], limit: number) {
  const results: any[] = [];
  let i = 0;

  const run = async () => {
    while (i < tasks.length) {
      const idx = i++;
      results[idx] = await tasks[idx]();
    }
  };

  await Promise.all(Array.from({ length: limit }, () => run()));
  return results;
}



// Handling Errors in Async
async function riskyThing() {
  throw new Error("oops!");
}

try {
  await riskyThing();
} catch (e:any) {
  console.error("Caught error:", e.message);
}


// Sequential vs Concurrent
// Sequential
await waitAndPrint("One", 1000);
await waitAndPrint("Two", 1000);

// Concurrent
await Promise.all([
  waitAndPrint("Three", 1000),
  waitAndPrint("Four", 1000),
]);

// Parallel vs Sequential Execution
async function task(name: string, delay: number) {
  console.log(`${name} start`);
  await wait(delay);
  console.log(`${name} end`);
}

async function sequential() {
  await task("A", 1000);
  await task("B", 1000);  // takes 2s
}

async function parallel() {
  await Promise.all([task("A", 1000), task("B", 1000)]);  // takes 1s
}


// async Delay - function delayedPrint(msg, delay) prints a message after delay ms.
async function delayedPrint(msg: string, delay: number) {
  await new Promise(resolve => setTimeout(resolve, delay));
  console.log(msg);
}

// Parallel Promises - Promise.all() to run three messages in parallel with different delays.
await Promise.all([
  delayedPrint("One", 500),
  delayedPrint("Two", 1000),
  delayedPrint("Three", 1500),
]);

// Sequential Flow - async function prints:
// 	•	“Starting”
// 	•	waits 1s, prints “Middle”
// 	•	waits 1s, prints “End”

async function timeline() {
  console.log("Starting");
  await delayedPrint("Middle", 1000);
  await delayedPrint("End", 1000);
}
await timeline();

// Handle Rejection - function mightFail() sometimes throws and handle it gracefully.
async function mightFail() {
  if (Math.random() > 0.5) throw new Error("Random fail!");
  return "Success";
}

try {
  const res = await mightFail();
  console.log(res);
} catch (e: any) {
  console.log("Caught:", e.message);
}

// Looping Async - for loop to run 5 delayed tasks (e.g. log each index after index*300ms).
for (let i = 0; i < 5; i++) {
  setTimeout(() => console.log(`Task ${i}`), i * 300);
}

// Profiling Performance
async function heavyComputation() {
  await wait(1000); // simulate some delay
  console.log("Heavy computation done!");
}

console.time("work");

await heavyComputation();

console.timeEnd("work");


// Exercises

// Exercise 1 – Async Basics
// Create an async function that logs “hello”, waits 2 seconds, then logs “bye”.
async function greeting() {
  console.log("hi");
  await wait(2000); 
  console.log("bye");
}

greeting();


// Exercise 2 – Parallel Tasks
// Create two tasks taskA and taskB, run them in parallel using Promise.all, 
// and log the time taken.
async function tasks(name: string, delay: number) {
  console.log(`${name} start`);
  await wait(delay);
  console.log(`${name} end`);
}

async function runTasks() {
  console.time("both");
  await Promise.all([tasks("A", 2000), tasks("B", 3000)])
  console.timeEnd("both")
}

runTasks();



// Exercise 3 – Sequential vs Parallel
// Write two long tasks (e.g. 2s and 3s) and compare total runtime when run sequentially vs in parallel.
async function sequence() {
  await tasks("A", 2000);
  await tasks("B", 3000); 
}

console.time('sequential');
sequence(); 
console.timeEnd('sequential');

async function parallels() {
  await Promise.all([tasks("A", 2000), tasks("B", 3000)]);
}

console.time('parallels');
parallels();
console.timeEnd('parallels');


// 🧠 Insight: await pauses. Promise.all() runs concurrently!

// ❗You called both sequence() and parallels() one after the other
// which means you ran both, but the results overlapped. 
// whoopsies added console.time


// Exercise 4 – Simulated Concurrency Control
// Limit max concurrent tasks to 2 using the withLimit() pattern above. Use fake tasks with random delays and log start/end times.
async function withLimits(tasks: (() => Promise<any>)[], limit:number) {
  const results: any[] = [];
  let i = 0; 

  const run = async () => {
    while (i < tasks.length) {
      const idx = i++;
      results[idx] = await tasks[idx]();
    }
  };
  await Promise.all(Array.from({length: limit}, () => run()));
  return results;
}

const fakeTasks = [
  () => tasks("A", 2000),
  () => tasks("B", 3000),
  () => tasks("C", 1000),
  () => tasks("D", 4000),
  () => tasks("E", 1500),
];

await withLimits(fakeTasks, 2);


// Exercise 5 – Event Loop Order
// Explore microtasks and macrotasks
    setTimeout(() => console.log("timeout"), 0);
    Promise.resolve().then(() => console.log("promise"));
    console.log("sync");
// Output? → sync, then promise, then timeout.

// 💡 Microtasks (.then()) run before macrotasks (setTimeout), 
// even if the timeout is 0ms. That’s JavaScript’s cheeky lil queue 💋


// Exercise 6 – Web Worker (Optional for Node)
// If in browser, explore how to use a Worker thread to offload a CPU task.


// Exercise 7 – Performance Timer
// Use console.time to benchmark the difference between:
// 	•	Array.map().filter().reduce() chaining vs.
// 	•	classic for loop

console.time("map-filter");
const result = Array(1e6).fill(1)
  .map(x => x + 1)
  .filter(x => x % 2 === 0)
  .reduce((a, b) => a + b, 0);
console.timeEnd("map-filter");

console.time("for-loop");
let sum = 0;
for (let i = 0; i < 1e6; i++) {
  const x = i + 1;
  if (x % 2 === 0) sum += x;
}
console.timeEnd("for-loop");

// 💡 You’ll likely see for-loop is faster—less abstraction overhead.