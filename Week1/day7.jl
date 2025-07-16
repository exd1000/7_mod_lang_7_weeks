# conditionals 

temp = 32 
if temp > 30
    println('Hot')
elseif temp >= 15
    println('Warm')
else 
    println('Cold')
end


# loops

# for loops
cities = ["Tokyo","Paris","New York"]
for city in cities
    println("$city is a major city.")
end

# while loops
i = 0
while i < 3
    println("Looping")
    i += 1
end


# vectorized/broadcast if

temps = [34, 29, 17, 10]
map(t -> t > 30 ? "Hot" : t >= 15 ? "Warm" : "Cold", temps)

# broadcasting with ifelse(): 

ifelse.(temps .> 30, "Hot", ifelse.(temps .>= 15, "Warm", "Cold"))


# Ex1: Vectorized If

#= Return a vector of:
	•	“Hot” if >30
	•	“Warm” if 15–30
	•	“Cold” if <15
Use map() or ifelse.(). =#

temps = [34, 29, 17, 10]
ifelse.(temps .>30, "Hot", ifelse.(temps .>= 15, "Warm", "Cold"))


# Ex2: Hour Classification

#= Return a vector like:
["Morning", "Afternoon", "Evening", "Night"]

Use map(hour -> ...) or a loop if needed. =# 


hours = [7, 13, 18, 2]
# map(hour -> hour > 0 ? "Morning": hour >= 12 ? "Afternoon": hour >= 17 ? "Evening": "Night", hours)


#= ❌ Logic order is flipped — hour > 0 captures everything > 0 first. 
=#

map(hour -> hour >= 6 && hour <= 11 ? "Morning" :
             hour >= 12 && hour <= 15 ? "Afternoon" :
             hour >= 16 && hour <= 19 ? "Evening" : "Night", hours)

             


# Ex3:  Loop Over Cities

#= Print: "Tokyo is a major city.", etc.=#

cities = ["Tokyo", "Paris", "New York"]

for city in cities
    println("$city is a major city.")
end

# Ex4: Score Classification
#= For each, print:
	•	90+: “Top-tier”
	•	75–89: “Strong”
	•	50–74: “Average”
	•	Below 50: “Needs review”

Use a loop or map(). =#

scores = [88, 74, 95, 67, 40]
for score in scores
    if score >= 90
        println("Top-tier")
    elseif score >= 75
        println("Strong")
    elseif score >=50
        println("Average")
    else
        println("Needs review")
    end
end



# Ex5: Dict Loop Challenge

#= Print a report like:
Alice: Strong  
Bob: Average  
Charlie: Top-tier  
Diana: Needs review
Use a for loop and string interpolation. =#

test_results = Dict(
    "Alice" => 89,
    "Bob" => 56,
    "Charlie" => 92,
    "Diana" => 33
    )

for name, score in pairs(test_results)
    if score >= 90
        println("$name: Top-tier")
    elseif score >= 75
        println("$name: Strong")
    elseif score >=50
        println("$name: Average")
    else
        println("$name: Needs review")
    end
end
