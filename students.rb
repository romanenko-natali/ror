require 'date'

module Validation
  def match(pattern, text)
    !!text.match(pattern)
  end

  def dateInRange(from, to, date)
    (from..to).cover?(date)
  end

  module_function :match, :dateInRange
end

class Student
  attr_accessor :first_name, :last_name, :birth_date, :student_id

  def initialize(first_name, last_name, birth_date, student_id)
    raise "Invalid first name" unless Validation.match(/^[a-zA-Z]+$/, first_name)
    raise "Invalid last name" unless Validation.match(/^[a-zA-Z]+$/, last_name)
    raise "Invalid date format" unless birth_date.is_a?(Date)
    raise "Invalid student ID" unless Validation.match(/^\d{5}$/, student_id)
    
    @first_name = first_name
    @last_name = last_name
    @birth_date = birth_date
    @student_id = student_id
  end
end

class Group
  attr_accessor :name, :students

  def initialize(name)
    raise "Invalid group name" unless Validation.match(/^[a-zA-Z0-9\s]+$/, name)
    @name = name
    @students = []
  end

  def add_student(student)
    @students << student
  end

  def find_student_by_id(student_id)
    @students.find { |student| student.student_id == student_id }
  end

  def sort_students
    @students.sort_by { |student| [student.last_name, student.first_name] }
  end
end

begin
  student1 = Student.new("John", "Doe", Date.new(2000, 1, 15), "12345")
  student2 = Student.new("Jane", "Doe", Date.new(1999, 5, 20), "12346")
  student3 = Student.new("Alice", "Smith", Date.new(2001, 8, 30), "12347")
  student4 = Student.new("Bob", "Brown", Date.new(1998, 11, 22), "12348")
  student5 = Student.new("Eve", "White", Date.new(2002, 2, 10), "12349")

  group1 = Group.new("Group A")
  group2 = Group.new("Group B")

  group1.add_student(student1)
  group1.add_student(student2)
  group2.add_student(student3)
  group2.add_student(student4)
  group2.add_student(student5)

  puts "Students in Group A:"
  group1.sort_students.each { |student| puts "#{student.last_name} #{student.first_name}" }

  puts "Students in Group B:"
  group2.sort_students.each { |student| puts "#{student.last_name} #{student.first_name}" }

  puts "Find student with ID 12347 in Group B:"
  found_student = group2.find_student_by_id("12347")
  puts "#{found_student.first_name} #{found_student.last_name}" if found_student

rescue => e
  puts "Error: #{e.message}"
end
