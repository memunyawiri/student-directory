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

def print_centered(students, chars = 12)
  i = 0
  students.each do |student|
    if student[:name].length < chars
      puts "#{student[:name]}".center(85)
      i += 1
    end
  end
  puts "We have #{i} students that have a name, that is less than 12 characters.".center(85)
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(85)
end


students = input_students
print_header
print_centered(students)
print_footer(students)
puts
