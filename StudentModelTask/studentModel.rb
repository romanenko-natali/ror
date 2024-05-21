require 'date'

module Validation
  def self.match(pattern, text)
    !!text.match(pattern)
  end

  def self.date_in_range(from, to, date)
    (from..to).cover?(date)
  end
end

class Student
  attr_accessor :first_name, :last_name, :birth_date, :record_book_number

  def initialize(first_name, last_name, birth_date, record_book_number)
    @first_name = first_name
    @last_name = last_name
    @birth_date = Date.parse(birth_date)
    @record_book_number = record_book_number
    validate!
  end

  private

  def validate!
    raise 'Invalid first name' unless Validation.match(/^[A-Za-z]+$/, @first_name)
    raise 'Invalid last name' unless Validation.match(/^[A-Za-z]+$/, @last_name)
    raise 'Invalid birth date' unless Validation.date_in_range(Date.new(1900, 1, 1), Date.today, @birth_date)
    raise 'Invalid record book number' unless Validation.match(/^\d+$/, @record_book_number)
  end
end

class Group
  attr_accessor :name, :students

  def initialize(name)
    @name = name
    @students = []
    validate!
  end

  def add_student(student)
    @students << student
  end

  def find_student_by_record_book(record_book_number)
    @students.find { |student| student.record_book_number == record_book_number }
  end

  def sort_students
    @students.sort_by! { |student| [student.last_name, student.first_name] }
  end

  private

  def validate!
    raise 'Invalid group name' unless Validation.match(/^[A-Za-z\s]+$/, @name)
  end
end

# Main program
begin
  student1 = Student.new('John', 'Doe', '2000-05-15', '12345')
  student2 = Student.new('Jane', 'Smith', '1999-07-20', '12346')
  student3 = Student.new('Mike', 'Johnson', '2001-12-10', '12347')
  student4 = Student.new('Emily', 'Brown', '2002-03-25', '12348')
  student5 = Student.new('Chris', 'Davis', '2000-08-30', '12349')


  group1 = Group.new('Group A')
  group2 = Group.new('Group B')

  group1.add_student(student1)
  group1.add_student(student2)
  group2.add_student(student3)
  group2.add_student(student4)
  group2.add_student(student5)

  puts "Student with record book number 12345 in Group A: #{group1.find_student_by_record_book('12345')&.first_name}"
  puts "Student with record book number 12347 in Group B: #{group2.find_student_by_record_book('12347')&.first_name}"

  group1.sort_students
  group2.sort_students

  puts "Sorted students in Group A:"
  group1.students.each { |student| puts "#{student.last_name}, #{student.first_name}" }

  puts "Sorted students in Group B:"
  group2.students.each { |student| puts "#{student.last_name}, #{student.first_name}" }

rescue => e
  puts "An error occurred: #{e.message}"
end
