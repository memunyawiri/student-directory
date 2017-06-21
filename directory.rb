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
  puts "The students of Villains Academy"
  puts "_______________"
end

def print(students)
  students.to_enum.with_index(1).each do |student, i|
    puts "#{i}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end


def print_footer(students)
  if students.count <= 1
  puts "Overall, we have #{students.count} great student"
else
  puts "Overall, we have #{students.count} great students"
  end
end

students = input_students
print_header
print(students)
print_footer(students)
