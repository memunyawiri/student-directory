def input_students
  puts "Please enter the name of the student"
  puts "To move on, just hit return twice"

  students = []
  name = gets.chomp



  while !name.empty? do
    puts "How old are you?"

    age = gets.chomp

    puts "What city do you live in?"

    location = gets.chomp

    puts "What cohort will you be joining?"

    cohort =  gets.chomp

    students << {name: name, age: age, location: location, cohort: cohort}
    if students.count == 1
      puts "Now we have #{students.count} student"
  else
      puts "Now we have #{students.count} students"
  end

    puts "Please add the next student"
    name = gets.chomp

  end
  
  if students.length == 0
    exit
  else
    students
  end
end

def print_header
  puts "The students of Villains Academy".center(85)
  puts "-------------".center(85)
end

def print_centered(students, chars = 12)
  i = 0
  students.each do |student|
    if student[:name].length < chars
      puts "#{student[:name]}, age: #{student[:age]}, from: #{student[:location]} (#{student[:cohort]} cohort)".center(85)
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
