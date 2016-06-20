    puts "Please enter student details"
    puts "To finish, just hit return twice."

def create_students
attributes = { name: "", cohort: "", hobby: "", country: "", height: "", fear: "", addiction: "" }
attributes.map do |attribute, value|
puts "Please enter the student's #{attribute}:"
value = gets.chomp
attributes[attribute] = value
end

students = []
students << attributes

students
end

def print_header(students)
students.length == 1 ? (puts "Now we have #{students.length} student") : (puts "Now we have #{students.length} students") 
   puts "The students of my cohort at Makers Academy".center(30)
   puts "-------------".center(30)
end

def print(students)
index = 0
while index < students.length
   puts "#{students[index][:name]} (#{students[index][:cohort]} cohort), enjoys #{students[index][:hobby]}, from #{students[index][:country]}, #{students[index][:height]}m tall, scared of #{students[index][:fear]} and can't live without #{students[index][:addiction]}.".center(30) 
   index += 1
end
   end

def print_footer(students)
students.length == 1 ?  (puts "We only have #{students.count} lonely student at the whole academy.".center(30)) : (puts "Overall, we have #{students.count} great students.".center(30))

end

students = create_students
print_header(students)
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

