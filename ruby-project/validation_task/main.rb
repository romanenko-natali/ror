# main.rb

require_relative 'student'
require_relative 'group'
require 'date'

# Main program
begin
  student1 = Student.new('John', 'Doe', Date.new(2000, 1, 15), '123456')
  student2 = Student.new('Jane', 'Smith', Date.new(1999, 5, 30), '234567')
  student3 = Student.new('Jim', 'Beam', Date.new(2001, 11, 22), '345678')
  student4 = Student.new('Jake', 'Long', Date.new(2002, 2, 28), '456789')
  student5 = Student.new('Jill', 'Short', Date.new(2000, 8, 14), '567890')

  # Students with invalid data (comment to check for errors)
  student_invalid = Student.new('john', 'doe', Date.new(2010, 1, 15), '12345')
  student_invalid2 = Student.new('Jane', 'Smith', Date.new(1920, 5, 30), '23456a')

  group1 = Group.new('Group A')
  group2 = Group.new('Group B')

  group1.add_student(student1)
  group1.add_student(student2)
  group1.add_student(student3)

  group2.add_student(student4)
  group2.add_student(student5)

  # Sorting students in a group
  group1.sort_students!
  group2.sort_students!

  # Search for a student by the number of a test report
  student_found = group1.find_student_by_id('123456')
  puts "Found student: #{student_found.first_name} #{student_found.last_name}"

  # Output of sorted lists of students
  puts "Group 1 students sorted:"
  group1.students.each { |student| puts "#{student.last_name} #{student.first_name}" }

  puts "Group 2 students sorted:"
  group2.students.each { |student| puts "#{student.last_name} #{student.first_name}" }
rescue => e
  puts "An error occurred: #{e.message}"
end
