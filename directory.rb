def input_students
    puts "Please enter student details"
    puts "To finish, just hit return twice."

students = []


attributes = ["name", "cohort", "hobby", "country", "height", "fear", "addiction"]
index = 0
while index < attributes.length
    current = attributes[index]
question = "Please enter the student's #{current}"
current = gets.chomp
break if current.empty?
students << students[index][current]
index += 1

    #students << {name: name, cohort: cohort, hobby: hobby, country: country, height: height, fear: fear, addiction: addiction }

    puts "Now we have #{students.count} students"
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
   puts "#{students[index][:name]} (#{students[index][:cohort]} cohort), enjoys #{students[index][:hobby]}, from #{students[index][:country]}, #{students[index][:height]} tall, scared of #{students[index][:fear]} and can't live without #{students[index][:addiction]}.".center(30) 
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

