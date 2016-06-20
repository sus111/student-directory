def input_students
    puts "Please enter student details"
    puts "To finish, just hit return twice."

students = []
puts "Please enter the names of the students"
name = gets.chomp
puts "Please enter the student's cohort"
cohort = gets.chomp

while !name.empty? || !cohort.empty? 
    students << {name: name, cohort: cohort, hobbies: "fishing", country: "Romania", height: "7ft", fears: "Spiders", addictions: "Chocolate" }
    puts "Now we have #{students.count} students"
puts "Please enter the names of the students"
name = gets.chomp
puts "Please enter the student's cohort"
cohort = gets.chomp
end
students
end

def print_header
   puts "The students of my cohort at Makers Academy".center(30)
   puts "-------------".center(30)
end

def print(students)
index = 0
while index < students.length
   puts "#{students[index][:name]} (#{students[index][:cohort]} cohort), enjoys #{students[index][:hobbies]}, from #{students[index][:country]}, #{students[index][:height]} tall, scared of #{students[index][:fears]} and can't live without #{students[index][:addictions]}.".center(30) 
   index += 1
end
   end

def print_footer(names)
    puts "Overall, we have #{names.count} great students.".center(30)
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

