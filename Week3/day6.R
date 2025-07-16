#  Read a File Line-by-Line
# lines <- readLines("fields.txt")
# for (line in lines) {
#   cat("Field:", line, "\n")
# }


# Write to a File
# tools <- c("VS Code is an Editor", "Python is a Language")
# writeLines(tools, "tools.txt")


# Append to a File
# write("New idea here", "ideas.txt", append = TRUE)


# Write & Read JSON (with jsonlite)
# library(jsonlite)

# student <- list(name = "Alice", score = 89, major = "CS")
# write(toJSON(student, pretty = TRUE), "student.json")

# parsed <- fromJSON("student.json")
# print(parsed$name)




# Exercise 1: Read fields.txt
    # AI
    # Cognitive Science
    # Data Science
    # Philosophy
# Print each line like: Field: AI
lines <- readLines('fields.txt')
for (line in lines) {
  cat('Field:', line, '\n')
}


# Exercise 2: Write Tool Map to tools.txt
# Write to file using writeLines().
tools <- c(
  "VS Code is an Editor",
  "Python is a Language",
  "Notion is for Notes"
)

writeLines(tools, 'tools.txt')

# Exercise 3: Append Research Idea
ideas <- c(
  'semantic drift',
  'recursion loop'
)


for (i in ideas) {
  write(i, "ideas.txt", append = TRUE)
}




# Exercise 4: JSON Export & Read
# 	•	Write to student.json
# 	•	Read it back and print name, score, and major

library(jsonlite)

student <- list(name = "Alice", score = 89, major = "CS")
write(toJSON(student, pretty = TRUE), 'student.json')

parsed <- fromJSON('student.json')
cat('Name:', parsed$name, '\nScore:', parsed$score, '\nMajor:', parsed$major)



# Exercise 5: Filter Scores ≥ 50
# Given a scores.txt:
#     92
#     45
#     88
#     51
#     33
# Read lines
# Convert to integers
# Print only scores ≥ 50

scores <- as.integer(readLines('scores.txt'))

for (score in scores) {
  if (score >= 50) {
    print(score)
  }
}