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

# 2. asyncio.gather
# Use asyncio.gather() to run 3 coroutines at the same time that wait different durations and print.

# 3. Write two async functions (do_a, do_b) that sleep 1 and 2 seconds. Run both with gather() and time them.

# 4. Create a function that uses ThreadPoolExecutor to square a list of numbers.

# 5. Write a coroutine that downloads data from a URL using aiohttp.

# 6. Use asyncio.Semaphore to limit concurrency (e.g. only 2 coroutines running at once).

# 7. Profile a function that loops 1000000 times.


# 8. Thread Pool
# Write a CPU-freezing function (e.g., slow_add) and run it across a thread pool using concurrent.futures.ThreadPoolExecutor.


# 9. Realistic Use Case
# Simulate a loading bar where 5 tasks complete in staggered time. Use asyncio.sleep() and print progress.