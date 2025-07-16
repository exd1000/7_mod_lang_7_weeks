# 🔧 Import Requirements
# using JSON  # or JSON3 if you prefer
# import Pkg
# Pkg.add("JSON")


# Read a File Line-by-Line
# lines = readlines("fields.txt")
# for line in lines
#     println("Field: ", line)
# end

# Write to a File
# open("tools.txt", "w") do f
#     write(f, "VS Code is an Editor\nPython is a Language\n")
# end

# Append to a File
# open("ideas.txt", "a") do f
#     write(f, "New idea here\n")
# end

# JSON Handling
# using JSON

# student = Dict("name" => "Alice", "score" => 89, "major" => "CS")
# open("student.json", "w") do f
#     write(f, JSON.json(student, 4))
# end

# parsed = JSON.parsefile("student.json")
# println(parsed["name"], parsed["score"], parsed["major"])




# Exercise 1: Read from fields.txt
# Field: AI
# Field: Cognitive Science

lines = readlines("fields.txt")
for line in lines
    println("Field: ", line)
end



# Exercise 2: Write Dictionary to tools.txt
# Write each as: VS Code is an Editor

tools = Dict("VS Code" => "Editor", "Python" => "Language", "Notion" => "Notes")
open("tools.txt","w") do f
    for (tool, role) in pairs(tools)
        write(f, "$tool is $role\n")
    end
end



# Exercise 3: Append a Research Idea
# Manually create a variable
# Append it to ideas.txt.

idea = "Memory remapping through drift"
open("ideas.txt","a") do f
    write(f, "$idea\n")
end




# Exercise 4: JSON Handling
# Read it back and print all 3 fields.

using JSON
student = Dict("name" => "Alice", "score" => 89, "major" => "CS")
open("student.JSON", "w") do f
    write(f, JSON.json(student,4))
end

parsed = JSON.parsefile("student.json")
# parsed = JSON.parsefile("student.JSON")  # Ensure filename case matches
println("Name: ", parsed["name"], " Score: ", parsed["score"], " Major: ", parsed["major"])

# Exercise 5: Score Filtering
# Write scores.txt with:
#     92
#     45
#     88
#     51
#     33
# 	•	Read the file
# 	•	Convert to integers
# 	•	Print only values ≥ 50

scores = [92,45,88,51,33]
open("scores.txt", "w") do f 
    for score in scores
        write(f,string(score)* "\n")
    end
end

lines = readlines("scores.txt")
for line in lines 
    score = parse(Int, line)
    if score >= 50
         println(score)
    end
end