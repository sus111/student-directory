
@students = [] #an empty array available to all methods
@filename = ""

def process(selection)
   case selection
      when "1"
            input_students
      when "2"
            show_students
      when "3"
            save_students
      when "4"
            load_chosen_file 
      when "9"
            puts "Goodbye!"
            exit
      else
            puts "I don't know what you want, please try again."
      end
end

def interactive_menu
puts "Welcome to the Maker's Academy Student Database".center(60)
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".center(60)
@students.count == 1 ? (puts "#{@students.count} student currently in #{@filename}".center(60)) : (puts "#{@students.count} students currenty in #{@filename}".center(60))
puts ""
   loop do
        print_menu
        process(STDIN.gets.chomp)
    end
end

def print_menu
puts "Please choose one of the following options:".center(30)
  puts "1. Input students"
  puts "2. Show students"
  puts "3. Save students to a chosen file"
  puts "4. Load students from a chosen file"
  puts "9. Exit"
end

def show_students
 print_header
 print_students_list
 #print_by_cohort
 print_footer
end

def select_cohort
month_not_found = true
while month_not_found
      puts "Please enter student's cohort:"
      cohort = STDIN.gets.chomp.downcase
      months = [ "january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december" ]
      if months.include?(cohort)
          month_not_found = false
          cohort.capitalize!
      elsif
        predicted_month = months.select { |month| month if month[0..2] == cohort[0..2] }[0].capitalize
      puts "Did you mean #{predicted_month}? Y/N"
      answer = STDIN.gets.chomp.upcase
        if answer == "Y"
            cohort = predicted_month
            month_not_found = false
        elsif answer == "N"
            puts "Please enter the month correctly."
        end
      else
          puts "Please enter the month correctly."
      end
end
cohort
end

def save_students
    choose_file
    file = File.open(@filename, "w")
    #iterate over the array of students
    index = 0
    while index < @students.length
    student_data = [@students[index][:name], @students[index][:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
    index += 1
    puts "You saved #{csv_line} to students.csv."
    end
    file.close
    puts "There are no students to be saved." if @students.length == 0 
end

def try_load_students
    @filename = ARGV.first
    @filename = "students.csv" if @filename.nil?
    if File.exists?(@filename)
        load_students(@filename)
    #    puts "Loaded #{@students.count} from #{filename}"
    else
        puts "Sorry, #{@filename} doesn't exist."
        exit
    end
end

def choose_file
    puts "Which file would you like to use?"
    puts "Enter 1 for students.csv, or specify other file:"
    STDIN.gets.chomp == "1" ? @filename = "students.csv" : @filename = STDIN.gets.chomp
end

def load_chosen_file
    choose_file
    load_students
    @students.count == 1 ? (puts "#{@students.count} student currently in #{@filename}") : (puts "#{@students.count} students currenty in #{@filename}")
end

def load_students(filename = "students.csv")
    file = File.open(@filename, "r")
    file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort}
    end
    file.close
   end

def input_students

   puts "Please enter student details, to finish hit return twice."

continue = true
  while continue
    puts "Please enter student's name:"
    name = STDIN.gets.chomp
    if name.empty?
        continue = false
    else
      cohort = select_cohort

      puts "Please enter student's country of birth:"
      country = STDIN.gets.chomp.capitalize
      country = "an unknown country" if country.empty?
      puts "Please choose the best word to describe this student:"
      character = STDIN.gets.chomp.downcase
      puts "Please enter student's biggest strength:"
      strength = STDIN.gets.chomp.downcase
      strength = "unknown" if strength.empty?

      student = {
        name: name,
        cohort: cohort,
        country: country,
        character: character,
        strength: strength
       }
      @students << student
      end
      puts "You've just entered #{@students[0][:name]} into the students' list."
    end
end

def print_header
        puts "Students of Makers Academy:".center(60)
   puts "-------------------------------------------\n".center(60)
end

def print_students_list
index = 0
  while index < @students.length
   puts "#{@students[index][:name]} (#{@students[index][:cohort]} cohort)".center(60)
   if @students[index][:country]
   puts "#{@students[index][:name]} is from #{@students[index][:country]} and is a #{@students[index][:character]} student, who's biggest strength lies in #{@students[index][:strength]}\n".center(60) 
   end
   index += 1
  end
  puts ""
end

def print_footer
   (puts "Sadly, we don't currently have any students at the Academy.".center(60)) if @students.length == 0
   (puts "We only have #{@students.count} lonely student at the whole academy.".center(60)) if @students.length == 1
   puts "----------------------------------------".center(60)
   (puts "Overall, we have #{@students.count} students.".center(60)) if @students.length > 1
   puts ""
end

try_load_students
interactive_menu

def print_by_cohort
cohorts = {}
index = 0
while index < @students.length
current = @students[index][:cohort]
cohort_exists = cohorts.has_key?(current) 
if cohort_exists
  cohorts[current] << @students[index]  
else 
cohorts[current] = [@students[index]]
end
index += 1
end

cohorts.each do |month, student|
    puts "#{month} Cohort:"
    index = 0
    while index < student.length
    puts "#{student[index][:name]}, from #{student[index][:country]}, a #{student[index][:character]} student, who's good at #{student[index][:strength]}." 
    index += 1
    end
end
end
