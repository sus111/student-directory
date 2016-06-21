def create_students

   puts "Please enter student details"
   puts "To finish, just hit return twice."

students = []
continue = true
  while continue
    puts "Please enter student's name:"
    name = gets.chomp
    if name.empty?
        continue = false
    else
      puts "Please enter student's cohort:"
      cohort = gets.chomp
      cohort = "unknown"  if cohort.empty?
      puts "Please enter student's hobby:"
      hobby = gets.chomp
      hobby = "unknown" if hobby.empty?
      puts "Please enter student's eye colour"
      eye_colour = gets.chomp
      eye_colour = "unknown" if eye_colour.empty?

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
   if students.length > 0  
     if students.length == 1 
        puts "Now we have #{students.length} student.".center(30)
        puts "The only student at Makers Academy:".center(30)
     else
        puts "Now we have #{students.length} students!" 
        puts "The students of my cohort at Makers Academy:".center(30)
     end
   puts "-------------------------------------------".center(30)
end
end

def print(students)
index = 0
while index < students.length
   puts "#{students[index][:name]} (#{students[index][:cohort]} cohort), enjoys #{students[index][:hobby]} with #{students[index][:eyes]} eyes.".center(30) 
   index += 1
end
   end
#

#students.map do |key, value|
#   puts key if key == :cohort
#end

#def print(students)
#
#index = 0
#while index < students.length
#puts "Students from the #{students[index][:cohort]} cohort:"
#puts current_cohort = students[index][:cohort]
#students[:cohort].each do |key, cohort| 
#  puts "#{students[index]}"   if cohort == current_cohort
#  index += 1
#end
#end
#end

def print_footer(students)
   (puts "Sadly, we don't currently have any students at the Academy.") if students.length == 0
   (puts "We only have #{students.count} lonely student at the whole academy.".center(30)) if students.length == 1
   (puts "Overall, we have #{students.count} great students.".center(30)) if students.length > 1
end

students = create_students
print_header(students)
print(students)
print_footer(students)


