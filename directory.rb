def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []

  name = gets.chomp

  while !name.empty? do

    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"

    name = gets.chomp
  end

  students
end

def print_header
  puts "The students of Villains Academy".center(85)
  puts "-------------".center(85)
end

def print_with_while(students)
  i = 0
  while i < students.length
    puts "#{students[i][:name]}".center(85)
    i += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(85)
end


students = input_students
print_header
print_with_while(students)
print_footer(students)
puts
