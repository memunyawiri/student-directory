@students = [] #an empty array accessible to all methods

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.delete("\n"))
  end
end

def print_menu
  puts "Please select and type in a number from the following options:"
  puts "1. Input the student data"
  puts "2. Show the current list of students"
  puts "3. Save the list of students"
  puts "4. Load the list of students"
  puts "9. Exit" # 9 because we'll be adding more items
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
      puts "I'm afraid '#{selection}'' isn't an option, please try again."
  end
end

def add_to_students(name, age, c_o_r, cohort)
  @students << {name: name, age: age, c_o_r: c_o_r, cohort: cohort.to_s.to_sym}
end

def input_students
  puts "Please enter the names of the students"
  name = STDIN.gets.delete("\n")
  while !name.empty?
    print "Age: "
    age = STDIN.gets.delete("\n")
    print "City of residence: "
    c_o_r = STDIN.gets.delete("\n")
    print "Cohort: "
    cohort = STDIN.gets.delete("\n")
    add_to_students(name, age, c_o_r, cohort)
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    puts "Please enter the next student, or hit enter to finish."
    name = STDIN.gets.delete("\n")
  end
  if @students.length == 0
    puts "NOTICE: You have not entered any students, please try again."
    exit
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy".center(65)
  puts "-------------------------------------------".center(65)
end

def print_student_list
  @students.sort_by! { |student| :cohort }
  @students.each do |student|
    puts
    puts "Name: #{student[:name]}".center(65)
    puts "Age: #{student[:age]}".center(65)
    puts "City of Residence: #{student[:c_o_r]}".center(65)
    puts "Cohort: #{student[:cohort]}".center(65)
  end
end

def print_footer
  puts
  puts "Overall, we have #{@students.count} great students".center(65)
  puts
end

def save_students
  count = 0
  require 'csv'
  CSV.open(filename, "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:age], student[:c_o_r], student[:cohort]]
      file.puts student_data
      count += 1
    end
  end
  puts "-----------------------------------".center(65)
  puts "#{count} students saved to '#{filename}'".center(65)
  puts "-----------------------------------".center(65)
end

def load_students(filename = "students.csv")
  count = 0
  require 'csv'
  CSV.open(filename, "r").readlines.each do |line|
    name, age, c_o_r, cohort = line
    add_to_students(name, age, c_o_r, cohort)
    count += 1
  end
  puts "------------------------------------------".center(65)
  puts "#{count} students loaded from '#{filename}'".center(65)
  puts "-------------------------------------------".center(65)
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil?
    load_students
  else
    loaded_file_exists(filename)
  end
end

def save_file
  puts "Please enter the file you would like to save the student data to"
  filename = STDIN.gets.delete("\n")
  while !filename.empty?
    if File.exists?(filename)
      save_students(filename)
      break
    else
      puts "Sorry, '#{filename}' doesn't exist, please re-enter or hit enter to continue."
      filename = STDIN.gets.delete("\n")
    end
  end
end

def loaded_file_exists(filename)
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exists
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def load_file
  puts "Please enter the file you'd like to load the data from"
  filename = STDIN.gets.delete("\n")
  while !filename.empty?
    if File.exists?(filename)
      load_students(filename)
      break
    else
      puts "Sorry, #{filename} doesn't exist. Please enter it again or hit enter to continue."
      filename = STDIN.gets.delete("\n")
    end
  end
end


try_load_students
interactive_menu
