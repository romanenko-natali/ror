# main.rb

require_relative 'student'
require_relative 'group'

begin
  students = [
    Student.new("John", "Doe", "2001-05-15", "12345"),
    Student.new("Jane", "Smith", "2002-08-22", "12346"),
    Student.new("Alice", "Johnson", "2000-11-30", "12347"),
    Student.new("Bob", "Brown", "2003-04-10", "12348"),
    Student.new("Charlie", "Davis", "1999-07-25", "12349"),
  ]

  invalid_students = [
    # Student.new("Invalid1", "Lastname", "2024-01-01", "12345"), # future DOB
    # Student.new("Valid", "Lastname", "2000-12-31", "1234"),     # invalid ID
    # Student.new("Valid", "Lastname", "abcd-ef-gh", "12345"),    # invalid DOB
    # Student.new("Valid", "1234", "2000-12-31", "12345"),        # invalid last name
    # Student.new("1234", "Lastname", "2000-12-31", "12345")      # invalid first name
  ]

  group1 = Group.new("Math Group")
  group2 = Group.new("Science Group")

  students.each_with_index do |student, index|
    if index.even?
      group1.add_student(student)
    else
      group2.add_student(student)
    end
  end

  puts "Students in #{group1.name}:"
  group1.sort_students!
  group1.students.each { |student| puts student }

  puts "\nStudents in #{group2.name}:"
  group2.sort_students!
  group2.students.each { |student| puts student }

  student_id_to_find = "12346"
  found_student = group1.find_student_by_id(student_id_to_find) || group2.find_student_by_id(student_id_to_find)
  puts "\nFound student with ID #{student_id_to_find}: #{found_student}" if found_student

rescue StandardError => e
  puts "An error occurred: #{e.message}"
end

