def interactive_menu
    students = []
    loop do
        # 1. print the menu and ask the user what to do
        puts "1. Input the students"
        puts "2. Show the students"
        puts "9. Exit"
        # 2. read the input and save it into a variable
        selection = gets.chomp
        # 3. do what the user has asked
        case selection
        when "1"
           students = input_students
        when "2"
            print_header(students)
            #print(students)
            print_by_cohort(students)
            print_footer(students)
        when "9"
            exit
        else
            puts "I don't know what you want, please try again."
        end
    end
end


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

def input_students

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
   puts "#{students[index][:cohort]} cohort)" 
   index += 1
  end
end

def print_by_cohort(students)
cohorts = {}
index = 0
while index < students.length
current = students[index][:cohort]
cohort_exists = cohorts.has_key?(current) 
if cohort_exists
  cohorts[current] << students[index]  
else 
cohorts[current] = [students[index]]
end
index += 1
end

cohorts.each do |month, student|
    puts "#{month} Cohort:"
    index = 0
    while index < student.length
    puts "#{student[index][:name]}, likes #{student[index][:hobby]} and has #{student[index][:eyes]} eyes." 
    index += 1
    end
end
end

def print_footer(students)
   (puts "Sadly, we don't currently have any students at the Academy.") if students.length == 0
   (puts "We only have #{students.count} lonely student at the whole academy.".center(30)) if students.length == 1
   (puts "Overall, we have #{students.count} great students.".center(30)) if students.length > 1
end

interactive_menu
students = input_students
#print_header(students)
#print_by_cohort(students)
#print_students(students)
#print_footer(students)

