
#  Arrays (like Python lists)
# 	•	Use push!() to append
# 	•	1-indexed access (concepts[1] is first)

concepts = ["ML", "AI", "Neuro"]
push!(concepts, "CogSci")



# Tuples
# 	•	Immutable, ordered, like Rust or Python tuples

coord = (40.7128, -74.0060)
lat = coord[1]



# Dictionaries
	# •	Use => for key-value pairs
	# •	Loop with for (k,v) in pairs(dict)

scores = Dict("Alice" => 88, "Bob" => 72)
scores["Charlie"] = 95



# Exercise 1: Arrays
# Create an array of 4 scientific fields. Then:
# 	•	Print the first and last
# 	•	Add one with push!()
# 	•	Print the updated length

fields = ["CogSci","AI","ML","DataSci"]
println(fields[1], fields[4])
push!(fields,"Neuro")
println(fields)

# 💡 You could also print length(fields) after the push.


# Exercise 2: Tuples
# Create a tuple coord = (lat, lon) and print both values.


coordinates = (40.84, -73.13)
println(coordinates[1], coordinates[2])

# Exercise 3: Unique Tags
# Remove duplicates using unique().

tags = ["python", "ai", "python", "data", "ai"]
println(unique(tags))


# Exercise 4: Scoring with Dict
# Loop and print:
#     Alice: Strong
#     Bob: Average
# Use this logic:
# 	•	90+: Top-tier
# 	•	75–89: Strong
# 	•	50–74: Average
# 	•	Below 50: Needs review


students = Dict(
  "Alice" => 89,
  "Bob" => 56,
  "Charlie" => 92,
  "Diana" => 33
)


for (name, score) in pairs(students)
  if score >= 90
    println("$name: Top-tier")
  elseif score >=75
    println("$name: Strong")
  elseif score >=50
    println("$name: Average")
  else
    println("$name: Needs review")
  end
end




# Exercise 5: Vector of Dicts (Structured Records)
# Loop through and print:
    # Alice (CS): Strong
    # Bob (Bio): Average

students = [
  Dict("name" => "Alice", "score" => 89, "major" => "CS"),
  Dict("name" => "Bob", "score" => 56, "major" => "Bio")
]


for student in students
  score = student["score"]
  grade = if score >= 90
    "Top-tier"
  elseif score >=75 
    "Strong"
  elseif score >=50
    "Average"
  else
    "Needs review"
  end 
  
  student["grade"] = grade 
  println("$(student["name"]) ($(student["major"])): $(student["grade"])")
end


# for (k,v) in pairs(students)
#   if students["score"] >= 90
#     students["grade"] => "Top-tier"
#   elseif students["score"] >=75
#     students["grade"] => "Strong"
#   elseif students["score"] >=50
#     students["grade"] => "Average"
#   else
#     students["grade"] => "Needs review"
#   end
#   println("$name ($major): $grade")
# end

# 🔥 What’s going wrong?
# ❌ 1. for (k, v) in pairs(students)
# 	•	You’re trying to loop over the array of Dicts as if it’s a dictionary. pairs(students) gives you index + value.
# 	•	You probably meant to loop through each student Dict directly.

# ❌ 2. students["score"] inside the loop
# 	•	students is a list — you should be accessing student["score"] from the current element in the loop.

# ❌ 3. This syntax is invalid:
#   students["grade"] => "Top-tier"  # ❌ Not how assignment works
# ❌ 4. Variables like name, major, and grade aren’t defined
