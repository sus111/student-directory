def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice."

students = { name: '', cohort: :november}
name = gets.chomp

while !name.empty? do
    students[:name] = name
    puts "Now we have #{students.count} students"
    name = gets.chomp
end
students
end

def print_header
   puts "The students of my cohort at Makers Academy"
   puts "-------------"
end

def print(students)
index = 0
while index < students.length
   puts students.keys()
   index += 1
end
   end

def print_footer(names)
    puts "Overall, we have #{names.count} great students."
end

students = input_students
print_header
print(students)
print_footer(students)

#students = [
# {name: "Dr. Hannibal Lecter", cohort: :november},
# {name: "Darth Vader", cohort: :november},
# {name: "Nurse Ratched", cohort: :november},
# {name: "Michael Corleone", cohort: :november},
# {name: "Alex DeLarge", cohort: :november},
# {name: "The Wicked Witch of the West", cohort: :november},
# {name: "Terminator", cohort: :november},
# {name: "Freddy Krueger", cohort: :november},
# {name: "The Joker", cohort: :november},
# {name: "Joffrey Baratheon", cohort: :november},
# {name: "Norman Bates", cohort: :november}
#]

