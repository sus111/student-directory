require 'csv'
@students = [] #an empty array available to all methods
@filename = "students.csv"

def process(selection)
   case selection
      when "1"
         input_students
      when "2"
         show_students
      when "3"
         retrieve_students
      when "4"
        load_students_from_csv
      when "9"
        puts "Goodbye!"
        exit
      else
        puts "I don't know what you want, please try again."
      end
end

def interactive_menu
   intro_message
   loop do
        print_menu
        process(STDIN.gets.chomp)
    end
end

def intro_message
  puts "Welcome to the Maker's Academy Student Database".center(60)
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".center(60)
  @students.count == 1 ? (puts "#{@students.count} student currently in #{@filename}".center(60)) : (puts "#{@students.count} students currenty in #{@filename}".center(60))
  puts ""
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
       cohort
    else
      predicted_month = months.select { |month| month if month[0..2] == cohort[0..2] }[0].capitalize
      puts "Did you mean #{predicted_month}? Y/N"
      answer = STDIN.gets.chomp.upcase
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

def predicted_month(cohort, months)
    cohort
end

def choose_file
  puts "Which file would you like to use?"
  puts "Enter 1 for students.csv, or specify other file:"
  STDIN.gets.chomp == "1" ? @filename = "students.csv" : @filename = STDIN.gets.chomp
end

def retrieve_students
  index = 0
  csv_line = []
    while index < @students.length
    student_data = @students[index][:name], @students[index][:cohort]
    csv_line << student_data.join(",")
    index += 1
    end
csv_line 
save_students(csv_line)
end

def save_students(csv_line)
  choose_file
  File.open(@filename, "w") do |file|
  file.puts csv_line
  puts "You saved #{csv_line} to students.csv."
  end
  puts "There are no students to be saved." if @students.length == 0 
end


def load_students_from_csv
    CSV.foreach(@filename) do |line|
        print line
    @students << {name: line[0], cohort: line[1]}
    @students.count == 1 ? (puts "#{@students.count} student currently in #{@filename}") : (puts "#{@students.count} students currently in #{@filename}")
    end
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

load_students_from_csv
interactive_menu
