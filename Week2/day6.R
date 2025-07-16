# Vectors 
# 	•	Ordered, homogeneous
# 	•	Use c() to create, length() to check size

concepts <- c("ML", "AI", "Cognition")
concepts[1]  # "ML"
length(concepts)


# Lists 
# 	•	Heterogeneous
# 	•	Use $ or [[ ]] to access elements

info <- list(name = "Alice", age = 30, skills = c("R", "Python"))
info$name


# Dataframes 
# 	•	Like SQL tables or Python pandas
# 	•	Row-wise and column-wise operations with apply(), ifelse(), etc.

df <- data.frame(
  name = c("Alice", "Bob"),
  score = c(88, 56),
  major = c("CS", "Bio")
)
df$name  # Column access



# Exercise 1: Vectors
# Create a vector of 4 scientific fields. Then:
# 	•	Print the first and last
# 	•	Add a fifth
# 	•	Get its length


fields <- c('ML','AI','CogSci','CompSci')
fields[1] # ML
fields[4]
length(fields)

# 💡 fields <- c(fields, "NeuroSci")



# Exercise 2: Lists
# Create a list with:
# 	•	name = your name
# 	•	languages = vector of 2 programming languages
# 	•	score = 95
# Access and print each value.

info <- list(name='Em',languages=c('Python','Rust'), score=95)
info[["name"]]
info$languages
info$score




# Exercise 3: Set Deduplication
# Use unique() to remove duplicates and print.


tags <- c("python", "data", "python", "ai", "data")

unique(tags)




# Exercise 4: Data Frame + Classification
# Create a students data frame
# Add a new column grade using ifelse() nested logic:
# 	•	90+: Top-tier
# 	•	75–89: Strong
# 	•	50–74: Average
# 	•	<50: Needs review


students <- data.frame(
  name = c("Alice", "Bob", "Charlie", "Diana"),
  score = c(89, 56, 92, 33),
  major = c("CS", "Bio", "CS", "Math")
)


# for (score in students$score) {
#   grade <- if (score >= 90) {
#     'Top-tier'
#   } else if (score >= 75) {
#     'Strong'
#   } else if (score >= 50) {
#     'Average'
#   } else {
#     'Needs review'
#   }
# }


# 🔴 This loop:
# 	•	Only processes the last value (score is overwritten)
# 	•	Doesn’t assign anything to students$grade


# ✅ Now students has a new grade column.

students$grade <- ifelse(
  students$score >= 90, "Top-tier",
  ifelse(
    students$score >= 75, "Strong",
    ifelse(
      students$score >= 50, "Average",
      "Needs review"
    )
  )
)


# Exercise 5: Print Report
# Loop through students and print:
    # Alice (CS): Strong
    # Bob (Bio): Average
# Use paste() or sprintf().


for (i in 1:nrow(students)) {
  name <- students$name[i]
  major <- students$major[i]
  grade <- students$grade[i]

  cat(sprintf('%s (%s): %s\n', name, major,grade))
}