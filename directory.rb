def select_cohort
month_not_found = true
while month_not_found
      puts "Please enter student's cohort:"
      cohort = gets.chomp.downcase
      months = [ "january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december" ]
      if months.include?(cohort)
          month_not_found = false
          cohort.capitalize!
      else
        predicted_month = months.select { |month| month if month[0..2] == cohort[0..2] }[0].capitalize
      puts "Did you mean #{predicted_month}? Y/N"
      answer = gets.chomp
        if answer == "Y"
            cohort = predicted_month
            month_not_found = false
        elsif answer == "N"
            puts "Please enter the month correctly."
        end
      end
end
cohort
end

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

      cohort = select_cohort


      puts "Please enter student's hobby:"
      hobby = gets.chomp
      hobby = "unknown hobbies" if hobby.empty?
      puts "Please enter student's eye colour"
      eye_colour = gets.chomp
      eye_colour = "unknown-coloured" if eye_colour.empty?

      student = {
        name: name,
        cohort: cohort,
        hobby: hobby,
        eyes: eye_colour
       }
      students << student
      end
    end
#  print students
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

def print_students(students)
index = 0
  while index < students.length
   puts "#{students[index][:name]} (#{students[index][:cohort]} cohort), enjoys #{students[index][:hobby]} with #{students[index][:eyes]} eyes.".center(30) 
   index += 1
  end
end


#def print_students(students)
#students.map do |key, value|
#   puts key if key == :cohort
#end

#index = 0
#while index < students.length
#puts "Students from the #{students[index][:cohort]} cohort:"
#puts current_cohort = students[index][:cohort]
#students[:cohort].each do |key, cohort| 
#  puts "#{students[index]}"   if cohort == current_cohort
#  index += 1
#end

def print_footer(students)
   (puts "Sadly, we don't currently have any students at the Academy.") if students.length == 0
   (puts "We only have #{students.count} lonely student at the whole academy.".center(30)) if students.length == 1
   (puts "Overall, we have #{students.count} great students.".center(30)) if students.length > 1
end

students = create_students
print_header(students)
print_students(students)
print_footer(students)
