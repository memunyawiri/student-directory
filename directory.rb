
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
  end
    students
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
    else
      puts "#{student[:name]}, age: #{student[:age]}, from: #{student[:location]} (#{student[:cohort]} cohort)".center(85)
      i += 1
    end
  end
end

=begin
def print_students_list(students)
  students.map { |student| student[:cohort]}
end
=end

def print_footer(students)
  if students.count == 1
    puts puts "Overall, we have #{students.count} great student.".center(85)
  else
    puts "Overall, we have #{students.count} great students.".center(85)
  end
end

def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we'll be adding more items
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      # input the students
      students = input_students
    when "2"
      # show the students
      print_header
      print_centered(students)
      print_footer(students)
    when "9"
      exit #this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end
end

interactive_menu






#print_students_list(students)
