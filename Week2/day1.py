# lists > ordered, mutable, accept mixed types (but avoid for consistency)
cities = ['Tokyo','Paris','New York']
cities.append('Berlin')
print(cities[0])


# tuples > immutable, great for coordinates/config/fixed-sized data
location = ("latitude","longitude")
print(location[0]) # latitude


# dictionaries > key-value stores, great for lookups/nested structures/configuration data
scores = {
    "Alice": 88,
    "Bob": 72
}
scores["Charlie"] = 95


# sets > unordered, automatically remove duplicates, fast membership checking
unique_tags = {"python", "ai", "data"}
unique_tags.add("python")  # No duplicate!


# real world example> imagine classifying research scores:

# students = {
#     "Alice": 89,
#     "Bob": 56,
#     "Charlie": 92,
#     "Diana": 33
# }

# for name, score in students.items():
#     if score >= 90:
#         grade = "Top-tier"
#     elif score >= 75:
#         grade = "Strong"
#     elif score >= 50:
#         grade = "Average"
#     else:
#         grade = "Needs review"
#     print(f"{name}: {grade}")
    
    
    
# Ex1: Lists 
'''
Create a list of your 4 favorite programming languages and:
	•	Print the first and last item
	•	Add one more language
	•	Remove one
'''

lang = ['Python','TypeScript','Rust','Go']
print(lang[0],lang[3])

lang.append('Julia')
# print(lang)


# Ex2: Tuples 
''' 
Create a tuple research_site with (latitude, longitude)
Print each value.
'''

research_site = ('latitude','longitude')
print(research_site[0],research_site[1])


# Ex3: Dictionary lookup
'''
Create a dictionary of 3 tools you use (e.g., "VS Code": "Editor")
Print what role each tool plays.
'''

tools = {
    'VS Code':'Editor',
    'ChatGPT':'Assistant',
    'Substack':'Writer'
}

print(tools.values())


''' 
💡 For clarity, loop through items:
for tool, role in tools.items():
    print(f"{tool} is a {role}")

'''




# Ex4: Set cleanup
''' 
Create a list with repeated tags. 
Turn it into a set and print the unique tags.
'''

tags = ["python", "data", "python", "ai", "data"]

print(set(tags))


# Ex5: Nested dictionary challenge 
'''
Create a nested dictionary. Write a loop that prints:
Alice (CS): Strong
Bob (Biology): Average
Use the same grading logic from last week.
'''

students = {
  "Alice": {"score": 89, "major": "CS"},
  "Bob": {"score": 56, "major": "Biology"}
}
    
# for name, info in students.items():
#     for score, grade in info[0].items():
#         if score >= 90:
#             grade = "Top-tier"
#         elif score >= 75:
#             grade = "Strong"
#         elif score >= 50:
#             grade = "Average"
#         else:
#             grade = "Needs review"
#     print(f'{name} ({info[1].keys()}): {grade}')

            
    
'''
Issues:
	•	info[0] doesn’t work — info is a dict ({"score": 89, "major": "CS"})
	•	You don’t need a nested loop — just access the values directly
'''
    
for name, info in students.items():
    score = info["score"]
    major = info["major"]
    
    if score >= 90:
        grade = "Top-tier"
    elif score >= 75:
        grade = "Strong"
    elif score >= 50:
        grade = "Average"
    else:
        grade = "Needs review"
        
    print(f"{name} ({major}): {grade}")