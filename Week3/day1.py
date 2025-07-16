
# Reading a File
# 	•	"r" for read, "w" for write, "a" for append
# 	•	with auto-closes files
 
# with open("data.txt", "r") as file:
#     content = file.read()
#     print(content)
    

# Writing to a File
# 	•	Overwrites file if it exists
# 	•	Use "a" to append instead
 
# with open("results.txt", "w") as file:
#     file.write("Experiment complete.\n")
    
    
# Reading Line by Line
# with open("data.txt") as f:
#     for line in f:
#         print(line.strip())
        
# Handling Input
# 	•	input() always returns a string

# name = input("Enter your name: ")


# Working with JSON

# import json

# data = {"name": "Alice", "score": 88}
# with open("data.json", "w") as f:
#     json.dump(data, f)

# with open("data.json") as f:
#     loaded = json.load(f)
#     print(loaded["score"])
    
    
    
# Exercise 1: Read From File
# Create a file called fields.txt with lines:
#     AI
#     Cognitive Science
#     Data Science
#     Philosophy
# Write a script that:
# 	•	Reads the file line-by-line
# 	•	Prints each with "Field: " in front


with open('/Users/edinh/Documents/7_mod_lang_7_weeks/Week3/fields.txt', 'r') as file: 
    content = file.read()
    print(content)


# 💡 Bonus: For the "Field: " prompt, you could’ve used:
# for line in file:
#     print("Field:", line.strip())


# Exercise 2: Write to File
# Create a Python dictionary of your favorite tools:
# Write each line to tools.txt like:
#     VS Code is an Editor
#     Python is a Language
tools = {"VS Code": "Editor", "Python": "Language", "Notion": "Notes"}

path = '/Users/edinh/Documents/7_mod_lang_7_weeks/Week3/tools.txt'
with open(path,'w') as file: 
    for tool, role in tools.items(): 
        file.write(f'{tool} is {role}.\n')

with open(path, 'r') as file: 
    content = file.read()
    print(content)



# Exercise 3: Append User Input
# Prompt the user for a research idea. Append it to ideas.txt:
#     Enter a research idea: Predicting attention from eye-tracking
# Each time the script runs, it should add a new line to the file.

idea = input('Enter a research idea: ')
path = '/Users/edinh/Documents/7_mod_lang_7_weeks/Week3/ideas.txt'

with open(path,'a') as file: 
    file.write(f'{idea}\n')

with open(path,'r') as file: 
    content = file.read()
    print(content)



# Exercise 4: JSON Dump + Load
# Create a dictionary of a student and write it to student.json. Then read and print the fields.

student = {"name": "Alice", "score": 89, "major": "CS"}
path = '/Users/edinh/Documents/7_mod_lang_7_weeks/Week3/student.json'

# 🔧 Fix with json module:
import json

with open(path, "w") as f:
    json.dump(student, f)

with open(path) as f:
    data = json.load(f)
    print(data["name"], data["score"], data["major"])

# 📛 This just writes a Python-formatted string, not valid JSON.
    # with open(path,'w') as file: 
    #     file.write(f'{student}')

    # with open(path,'r') as file: 
    #     content = file.read()
    #     print(content)


# Exercise 5: Open-Ended – Filter File Contents
# Write a file scores.txt with scores on each line:
#     92
#     45
#     88
#     51
#     33
# Read the file, and:
# 	•	Filter the scores
# 	•	Print only those ≥ 50

score = [92,45,88,51,33]
path = '/Users/edinh/Documents/7_mod_lang_7_weeks/Week3/scores.txt'

with open(path,'w') as file: 
    for i in score: 
        file.write(f'{i}\n')

with open(path,'r') as file: 
    for line in file: 
        i = int(line.strip())
        if i >= 50:
            print(i)    