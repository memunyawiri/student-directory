@students = [] #an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.delete("\n"))
  end
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
    puts "Please enter the next student"
    name = STDIN.gets.delete("\n")
  end
  if @students.length == 0
    puts "NOTICE: You have not entered any students, please try again."
    exit
  else
    @students
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy".center(65)
  puts "------------------------".center(65)
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
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], age[:age], c_o_r[:c_o_r], student[:cohort]]
    csv_line = student_data.join(',')
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    add_to_students(name, age, c_o_r, cohort)
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exists
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end


try_load_students
interactive_menu
