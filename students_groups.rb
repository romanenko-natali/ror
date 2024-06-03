require 'date'

# Validation module
module Validation
  def self.match(pattern, text)
    !!(text =~ pattern)
  end

  def self.dateInRange(from, to, date)
    from_date = Date.parse(from)
    to_date = Date.parse(to)
    date_date = Date.parse(date)
    date_date >= from_date && date_date <= to_date
  end
end

# Custom Error classes
class InvalidDataError < StandardError; end

# Student class
class Student
  attr_accessor :first_name, :last_name, :birth_date, :student_number

  NAME_PATTERN = /^[A-Z][a-z]+$/
  NUMBER_PATTERN = /^\d{5,10}$/

  def initialize(first_name, last_name, birth_date, student_number)
    self.first_name = first_name
    self.last_name = last_name
    self.birth_date = birth_date
    self.student_number = student_number

    validate!
  end

  private

  def validate!
    raise InvalidDataError, 'Invalid first name' unless Validation.match(NAME_PATTERN, first_name)
    raise InvalidDataError, 'Invalid last name' unless Validation.match(NAME_PATTERN, last_name)
    raise InvalidDataError, 'Invalid birth date' unless Validation.dateInRange('1900-01-01', '2020-01-01', birth_date)
    raise InvalidDataError, 'Invalid student number' unless Validation.match(NUMBER_PATTERN, student_number)
  end
end

# Group class
class Group
  attr_accessor :name, :students

  NAME_PATTERN = /^[A-Z][a-z0-9]+$/

  def initialize(name, students = [])
    self.name = name
    self.students = students

    validate!
  end

  def add_student(student)
    students << student
  end

  def find_student(student_number)
    students.find { |student| student.student_number == student_number }
  end

  def sort_students!
    students.sort_by! { |student| [student.last_name, student.first_name] }
  end

  private

  def validate!
    raise InvalidDataError, 'Invalid group name' unless Validation.match(NAME_PATTERN, name)
  end
end

# Main program
begin
  student1 = Student.new('John', 'Doe', '2000-05-15', '123456')
  student2 = Student.new('Jane', 'Doe', '1998-04-22', '234567')
  student3 = Student.new('Alice', 'Smith', '1995-12-30', '345678')
  student4 = Student.new('Bob', 'Brown', '2001-09-01', '456789')
  student5 = Student.new('Eve', 'White', '2002-07-11', '567890')

  group1 = Group.new('Group1')
  group2 = Group.new('Group2')

  group1.add_student(student1)
  group1.add_student(student2)
  group1.add_student(student3)

  group2.add_student(student4)
  group2.add_student(student5)

  puts 'Group1 students:'
  group1.students.each { |student| puts "#{student.first_name} #{student.last_name}" }

  puts 'Group2 students:'
  group2.students.each { |student| puts "#{student.first_name} #{student.last_name}" }

  # Search for a student by student number
  found_student = group1.find_student('234567')
  puts "Found student in Group1: #{found_student.first_name} #{found_student.last_name}" if found_student

  # Sort students in group1
  group1.sort_students!
  puts 'Group1 students sorted:'
  group1.students.each { |student| puts "#{student.first_name} #{student.last_name}" }

rescue InvalidDataError => e
  puts "Error: #{e.message}"
end
