require 'date'

module Validation
  def self.match(pattern, text)
    !!text.match(pattern)
  end

  def self.dateInRange(from, to, date)
    date >= from && date <= to
  end
end

class Student
  include Validation

  attr_accessor :first_name, :last_name, :birthdate, :student_id

  def initialize(first_name, last_name, birthdate, student_id)
    @first_name = first_name
    @last_name = last_name
    @birthdate = birthdate
    @student_id = student_id

    validate_student_info
  end

  private

  def validate_student_info
    unless Validation.match(/^[A-Za-z]+$/, first_name) &&
           Validation.match(/^[A-Za-z]+$/, last_name) &&
           Validation.dateInRange(Date.new(1900, 1, 1), Date.today, birthdate) &&
           Validation.match(/^\d{6}$/, student_id)
      raise ArgumentError, "Invalid student information provided"
    end
  end
end

class Group
  include Validation

  attr_accessor :name, :students

  def initialize(name)
    @name = name
    @students = []
  end

  def add_student(student)
    @students << student
  end

  private

  def validate_group_name
    unless Validation.match(/^[A-Za-z0-9\s]+$/, name)
      raise ArgumentError, "Invalid group name provided"
    end
  end
end

# Головна програма

# Створюємо 5 студентів
students = [
  Student.new("John", "Doe", Date.new(1995, 5, 10), "123456"),
  Student.new("Jane", "Smith", Date.new(2000, 12, 30), "654321"),
  Student.new("Alice", "Johnson", Date.new(1998, 3, 15), "987654"),
  Student.new("Bob", "Brown", Date.new(1997, 8, 20), "111222"),
  Student.new("Eve", "Taylor", Date.new(2002, 2, 5), "333444")
]

# Створюємо дві групи
group1 = Group.new("Group 1")
group2 = Group.new("Group 2")

# Розділяємо студентів по групах
students.each_with_index do |student, index|
  index.even? ? group1.add_student(student) : group2.add_student(student)
end

# Пошук студента по заліковці
def find_student_by_id(students, student_id)
  students.find { |student| student.student_id == student_id }
end

puts "Student with ID 123456: #{find_student_by_id(students, "123456").first_name} #{find_student_by_id(students, "123456").last_name}"
puts "Student with ID 999999: #{find_student_by_id(students, "999999")}" # Виведе nil

# Сортування студентів групи в алфавітному порядку
group1.students.sort_by! { |student| [student.last_name, student.first_name] }
group2.students.sort_by! { |student| [student.last_name, student.first_name] }

puts "Students in Group 1:"
group1.students.each { |student| puts "#{student.last_name}, #{student.first_name}" }

puts "Students in Group 2:"
group2.students.each { |student| puts "#{student.last_name}, #{student.first_name}" }
