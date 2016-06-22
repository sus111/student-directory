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
#print cohorts

cohorts.each do |month, student|
    puts "#{month} Cohort:"
    index = 0
    while index < student.length
    puts "#{student[index][:name]}, likes #{student[index][:hobby]} and has #{student[index][:eyes]} eyes." 
    index += 1
    end
end
end
