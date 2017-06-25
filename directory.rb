def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

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
# Added if statement below to exit the code if no students are entered.
  if students.length == 0
    puts "NOTICE: You have not entered any students, please try again."
    exit
  else
    students
  end
end

def print_header
  puts "The students of Villains Academy".center(85)
  puts "-------------".center(85)
end

def print_centered(students, cohort = "July")
  i = 0
  students.each do |student|
    if student[:cohort].empty?
      puts "#{student[:name]}, age: #{student[:age]}, from: #{student[:location]} (#{cohort.to_s} cohort)".center(85)
      i += 1
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(85)
end


students = input_students
print_header
print_students_list(students)
print_footer(students)
puts
