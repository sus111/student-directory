def create_students

   puts "Please enter student details"
   puts "To finish, just hit return twice."

students = []
continue = true
  while continue
    puts "Please enter student's name"
    name = gets.chomp
    if name.empty?
        continue = false
    else
      puts "Please enter student's cohort"
      cohort = gets.chomp
      puts "Please enter student's hobby"
      hobby = gets.chomp
      puts "Please enter student's eye colour"
      eye_colour = gets.chomp
      student = {
        name: name,
        cohort: cohort,
        hobby: hobby,
        eyes: eye_colour
       }
      students << student
    end
  end
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
