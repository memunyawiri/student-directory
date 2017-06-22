def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []

  name = gets.chomp

  while !name.empty? do

    students << {name: name, cohort: :november}
    if students.count <= 1
    puts "Now we have #{students.count} student"
  else
    puts "Now we have #{students.count} students"
  end
    name = gets.chomp
  end

  students
  end

def print_header
  puts "The students of Villains Academy".center(65)
  puts "_______________".center(65)
end

def print_centered(students)
  students.to_enum.with_index(1).each do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)".center(65)
  end
end

def print_footer(students)
  if students.count <= 1
  puts "Overall, we have #{students.count} great student".center(65)
else
  puts "Overall, we have #{students.count} great students".center(65)
  end
end

students = input_students
print_header
print_centered(students)
print_footer(students)
