
def create_students
    puts "Please enter student details"
    puts "To finish, just hit return twice."

 puts "Please enter name"
 name = gets.chomp
  puts "Please enter cohort"
  cohort = gets.chomp

students = []

while !name.empty? || !cohort.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    puts "Please enter name"
    name = gets.chomp
    puts "Please enter cohort"
    cohort = gets.chomp
end
students
end


#
#while !name.empty? || !cohort.empty?
#  students << { name: name, cohort: cohort}
#  puts "Please enter name"
#  name = gets.chomp
#  puts "Please enter cohort"
#  cohort = gets.chomp
#return students
#  end
#students
#end
#students.length == 1 ? (puts "Now we have #{students.length} student") : (puts "Now we have #{students.length} students") 
#
    

def print_header(students)
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
#
#puts "Please enter the student's name"
#value = gets.chomp
#
#  students = []
#  attributes = {}
#while value.length > 0 
#
#attributes = { name: value, cohort: "", hobby: "", country: "", height: "", fear: "", addiction: "", }
# attributes(name:).reject{|attribute, value| attribute == :name}.map do |attribute, value|
#     
#  puts "Please enter the student's #{attribute}:"
#  value = gets.chomp
#  attributes[attribute] = value
#  
#puts "Please enter the student's name"
#value = gets.chomp
#  end
#  return attributes
#students << attributes
#end
#students
#end
#
#
#students.length == 1 ? (puts "Now we have #{students.length} student") : (puts "Now we have #{students.length} students") 
#
