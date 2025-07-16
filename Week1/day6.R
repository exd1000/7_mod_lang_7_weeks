
# basic if/ifelse 

temp <- 32 
if (temp > 30) {
    print('Hot')
} else if (temp >=15) {
    print('Warm')
} else {
    print('Cold')
}

# vectorized comparison > ifelse():

temps <- c(32,18,12)
ifelse(temps > 30, 'Hot',
    ifelse(temps >=15,'Warm','Cold'))


# vectorized apply() family 

scores <- c(88,74,95,67,40)
# use sapply to apply function to each element
sapply(scores, function(score) {
    if (score >= 90) {
        'Top-tier'
    } else if (score >= 75) {
        'Strong'
    } else if (score >= 50) {
        'Average'
    } else {
        'Needs review'
    }
})

# looping (R allows it but rarely needed)

cities <- c('Tokyo','Paris','New York')
for (city in cities) {
    print(paste(city,'is a major city'))
}



# Ex1: Vectorized If/Else
#Create a temps vector & print:
# 	•	“Hot” if >30
# 	•	“Warm” if 15–30
# 	•	“Cold” if <15
# Use ifelse() to do this in one line.

temps <- c(34, 29, 17, 10)


ifelse(temps > 30, 'Hot',
    ifelse(temps >=15, 'Warm','Cold'))


# ✅ Perfect use of nested ifelse()!
# 💡 You could assign the result to a variable if needed:
# labels <- ifelse(...)



# Ex2: Switch-Like Classification
# Use sapply() on a vector:
# Map:
# 	•	6–11 → Morning
# 	•	12–15 → Afternoon
# 	•	16–19 → Evening
# 	•	Else → Night

# Return a character vector like: 
# ["Morning", "Afternoon", "Evening", "Night"]


hours <- c(7, 13, 18, 2)
sapply(hours,function(hour) {
    if (hour >= 6 && hour < 12) {
        'Morning'
    } else if (hour >=12 && hour < 16) {
        'Afternoon'
    } else if (hour >= 16 && hour < 20) {
        'Evening'
    } else {
        'Night'
    }
})


# Ex3:  Loop Over Cities
# Loop over them and print:
# "Tokyo is a major city.", etc.

cities <- c("Tokyo", "Paris", "New York")

for (city in cities) {
    print(paste(city, 'is a major city'))
}


# Ex4: Score Classification 
# Given: Use sapply() or ifelse() to print:
	# •	90+: “Top-tier”
	# •	75–89: “Strong”
	# •	50–74: “Average”
	# •	Below 50: “Needs review”


scores <- c(88, 74, 95, 67, 40)

# sapply(scores, function(score)) {
#     if (score >= 90) {
#         'Top-tier'
#     } else if (score >= 75) {
#         'Strong'
#     } else if (score >= 50) {
#         'Average'
#     } else {
#         'Needs review '
#     }
# }

# ⚠️ Syntax issue: the parentheses after function(score) need to go.

sapply(scores, function(score) {
  if (score >= 90) {
    'Top-tier'
  } else if (score >= 75) {
    'Strong'
  } else if (score >= 50) {
    'Average'
  } else {
    'Needs review'
  }
})



# Ex5: Name/Score Report with Classification
# Use a named vector Print a report like:
# Alice: Strong  
# Bob: Average  
# Charlie: Top-tier  
# Diana: Needs review

test_results <- c(
  Alice = 89,
  Bob = 56,
  Charlie = 92,
  Diana = 33
)

# for (names,scores in test_results) {
#     sapply(scores, function(score)) {
#     if (score >= 90) {
#         grade <- 'Top-tier'
#     } else if (score >= 75) {
#          grade <- 'Strong'
#     } else if (score >= 50) {
#          grade <- 'Average'
#     } else {
#          grade <- 'Needs review '
#     }
# }
#     print(paste(names,':', grade))
# }




# There are a few issues here:
# 	1.	test_rests is a typo (test_results)
# 	2.	for (names,scores in ...) is not valid R
# 	3.	sapply() shouldn’t be inside the loop like that



for (name in names(test_results)) {
  score <- test_results[[name]]
  grade <- if (score >= 90) {
    "Top-tier"
  } else if (score >= 75) {
    "Strong"
  } else if (score >= 50) {
    "Average"
  } else {
    "Needs review"
  }
  print(paste(name, ":", grade))
}
