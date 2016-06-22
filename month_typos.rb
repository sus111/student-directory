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

select_cohort
