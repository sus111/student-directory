def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice."

#def print(students, letter)
#   students.each_with_index do |student, index|
#       if student[:name].length < 12
#   puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name][0] == letter
#end
#   end
#end
#
name = gets.chomp
students = []
while !name.empty? do
    students << {name: name, cohort: :november}
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
   puts "#{students[index][:name]} (#{students[index][:cohort]} cohort)" 
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

