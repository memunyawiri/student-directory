@students = [] #an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  name = gets.chomp

  while !name.empty? do
    puts "How old are you?"

    age = gets.chomp

    puts "What city do you live in?"

    location = gets.chomp

    puts "What cohort will you be joining?"

    cohort =  gets.chomp

    @students << {name: name, age: age, location: location, cohort: cohort}

    if @students.count == 1
      puts "Now we have #{@students.count} student"
  else
      puts "Now we have #{@students.count} students"
    end

    puts "Please add the next student"
    name = gets.chomp

  end
# Added if statement below to exit the code if no students are entered.
  if @students.length == 0
    puts "NOTICE: You have not entered any students, please try again."
    exit
  end
end


def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, please try again"
  end
end

def print_header
  puts "The students of Villains Academy".center(85)
  puts "-------------".center(85)
end

def print_students_list(cohort = "July")
  i = 0
  @students.each do |student|
    if student[:cohort].empty?
      puts "#{student[:name]}, age: #{student[:age]}, from: #{student[:location]} (#{cohort.to_s} cohort)".center(85)
    else
      puts "#{student[:name]}, age: #{student[:age]}, from: #{student[:location]} (#{student[:cohort]} cohort)".center(85)
      i += 1
    end
  end
end

def print_footer
  if @students.count == 1
    puts puts "Overall, we have #{@students.count} great student.".center(85)
  else
    puts "Overall, we have #{@students.count} great students.".center(85)
  end
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(',')
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

interactive_menu
