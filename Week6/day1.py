# Week 6 – Day 1: Python – Async & Concurrency

# async / await - Run tasks without blocking other (concurrency)
# coroutine - A function you can pause & resume (async def)
# event loop - The scheduler that runs async tasks.
# concurrent.futures - Run things in background threads or processes.
# threading / multiprocessing - Run multiple flows in parallel (different models of concurrency).

# threading - I/O-bound tasks
#     libraries: threading, concurrent.futures.ThreadPoolExecutor
# multiprocessing - CPU-bound tasks
#     libraries: multiprocessing, concurrent.futures.ProcessPoolExecutor 
# asyncio - High-performance I/O concurrency (single-threaded)
#     libraries: asyncio, aiohttp



# Basic Async Example
import asyncio

async def say_hi():
    print("hi")
    await asyncio.sleep(1)
    print("bye")

asyncio.run(say_hi())


# Running Many Coroutines
import asyncio

async def greet(name):
    print(f"Hello, {name}")
    await asyncio.sleep(1)
    print(f"Goodbye, {name}")

async def main():
    await asyncio.gather(
        greet("Em"),
        greet("Benji"),
        greet("Elias")
    )

asyncio.run(main())



# ThreadPool example using concurrent.futures for threads
import concurrent.futures
import time

def do_work(x):
    time.sleep(2)
    return x * 2

with concurrent.futures.ThreadPoolExecutor() as executor:
    results = list(executor.map(do_work, range(5)))
    print(results)


# from concurrent.futures import ThreadPoolExecutor
# import time

# def slow_function(x):
#     time.sleep(1)
#     return x * 2

# with ThreadPoolExecutor() as executor:
#     results = executor.map(slow_function, [1, 2, 3])
#     print(list(results))  # [2, 4, 6]


# Profiling Performance
import time

start = time.time()
# your code
end = time.time()
print(f"Took {end - start:.2f} seconds")

# For deeper profiling:
    # pip install line_profiler
    # kernprof -l script.py
    # python -m line_profiler script.py.lprof


# Mixing asyncio with HTTP
import aiohttp
import asyncio

async def fetch(url):
    async with aiohttp.ClientSession() as session:
        async with session.get(url) as response:
            return await response.text()

async def main():
    html = await fetch('https://example.com')
    print(html[:100])

asyncio.run(main())



# Exercises


# 1. async Basics
# Write an async function wait_and_print(msg, delay) that prints a message after a delay. Run two concurrently.
import asyncio 

async def wait_and_print(msg, delay): 
    await asyncio.sleep(delay)
    print(msg)
    await asyncio.sleep(delay)
    print(f'{msg}... why are you still here?')

names = ['em', 'eli']

async def main():
    await asyncio.gather(*[
        wait_and_print(f'hey {name}', 3) for name in names
    ])
asyncio.run(main())

# 💡 *[] unpacks the list of coroutines into arguments for gather. 
# The for loop inside gather directly was invalid syntax. // whoopsies my bad 


# 2. asyncio.gather
# Use asyncio.gather() to run 3 coroutines at the same time that wait different durations and print.
async def main(): 
    await asyncio.gather(
        wait_and_print('one',1),
        wait_and_print('two',2),
        wait_and_print('three',3)
    )

asyncio.run(main())


# 3. Write two async functions (do_a, do_b) that sleep 1 and 2 seconds. Run both with gather() and time them.
import time 

async def do_a(n):
    print('calculating..')
    await asyncio.sleep(1)
    a = n+1 
    print(a)
    return a 

async def do_b(x):
    print('calculating the harder part..')
    await asyncio.sleep(2)
    b = x+2
    print(b)
    return b

async def main():
    start = time.time()
    await asyncio.gather(
        do_a(2), 
        do_b(2)
    )
    end = time.time()
    print(f'time: {end - start:.2f} secs')

asyncio.run(main())



# 4. Create a function that uses ThreadPoolExecutor to square a list of numbers.
from concurrent.futures import ThreadPoolExecutor
import time


def square(x):
    time.sleep(2)
    return x^2

with ThreadPoolExecutor() as executor:
    results = executor.map(square, [1,3,5])
    print(list(results))
    
# This simulates blocking CPU work using threads. 🔩


# 5. Write a coroutine that downloads data from a URL using aiohttp.
import aiohttp

async def fetch(url):
    async with aiohttp.ClientSession() as session: 
        async with session.get(url) as response:
            return await response.text()

async def main():
    html = await fetch('https://google.com')
    print(html[:100])

asyncio.run(main())


# 6. Use asyncio.Semaphore to limit concurrency (e.g. only 2 coroutines running at once).
sem = asyncio.Semaphore(2)

async def limited(name, delay):
    async with sem:
        print(f'{name} started')
        await asyncio.sleep(delay)
        print(f'{name} completed')

async def main():
    await asyncio.gather(*[
        limited(f'task{i}', i % 3 + 1) for i in range(5)
    ])

asyncio.run(main())


# Only 2 tasks run concurrently because of the semaphore. 
# Great for rate-limiting or bounded resources.



# 7. Profile a function that loops 1000000 times.
import time 


def yikes(x):
    for i in range(1_000_000):
        x+=1 
    return x

start = time.time()
yikes(0)
end = time.time()

print(f'{end - start:.2f} seconds')

# 🧠 You can go deeper with cProfile later, but this is great for basic timing.


# 8. Thread Pool
# Write a CPU-freezing function (e.g., slow_add) and run it across a thread pool using concurrent.futures.ThreadPoolExecutor.

from concurrent.futures import ThreadPoolExecutor
import time

def slow_add(x):
    time.sleep(2)
    return x + 1

with ThreadPoolExecutor() as executor:
    results = executor.map(slow_add, [1, 2, 3])
    print(list(results))


# Threads are ok for IO-bound stuff. 
# For CPU-bound you might use ProcessPoolExecutor instead for true parallelism.

# 9. Realistic Use Case
# Simulate a loading bar where 5 tasks complete in staggered time. Use asyncio.sleep() and print progress.

async def fake_work(i, delay):
    print(f'task {i} starting..')
    await asyncio.sleep(delay)
    print(f'task {i} completed')

async def main():
    await asyncio.gather(*[
        fake_work(i, i%3+1) for i in range(5)
    ])

asyncio.run(main())