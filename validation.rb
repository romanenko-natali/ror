require 'date'

module Validation
  def self.match(pattern, text)
    unless text.match?(pattern)
      raise ArgumentError, "Text '#{text}' does not match pattern '#{pattern}'"
    end
  end

  def self.dateInRange(from, to, date)
    unless date >= from && date <= to
      raise ArgumentError, "Date '#{date}' is not in range '#{from}' to '#{to}'"
    end
  end
end

class Student
  attr_reader :first_name, :last_name, :birth_date, :student_id

  def initialize(first_name, last_name, birth_date, student_id)
    Validation.match(/\A[A-Za-z]+\z/, first_name)
    Validation.match(/\A[A-Za-z]+\z/, last_name)
    Validation.dateInRange(Date.new(1900, 1, 1), Date.today, birth_date)
    Validation.match(/\A\d+\z/, student_id)

    @first_name = first_name
    @last_name = last_name
    @birth_date = birth_date
    @student_id = student_id
  end
end

class Group
  attr_reader :name, :students

  def initialize(name)
    Validation.match(/\A[\w\s]+\z/, name)
    @name = name
    @students = []
  end

  def add_student(student)
    @students << student
  end

  def sort_students
    @students.sort_by! { |student| [student.last_name, student.first_name] }
  end
end

students = [
  Student.new("John", "Doe", Date.new(2000, 1, 1), "12345"),
  Student.new("Jane", "Smith", Date.new(1995, 5, 5), "67890"),
  Student.new("Alice", "Wonderland", Date.new(1980, 12, 12), "54321"),
  Student.new("Bob", "Marley", Date.new(1970, 3, 3), "13579"),
  # 😉 add some Invalid users to check if Validation works
  # Student.new("123", "Doe", Date.new(2000, 1, 1), "12345"),
  # Invalid student with birth date out of range
  # Student.new("John", "Doe", Date.new(1800, 1, 1), "12345"),
  # Invalid student with non-numeric student ID
  # Student.new("John", "Doe", Date.new(2000, 1, 1), "abc"),
]

group1 = Group.new("Group BOOM")
group2 = Group.new("Group BAM")

group1.add_student(students[0])
group1.add_student(students[1])
group2.add_student(students[2])
group2.add_student(students[3])

group1.sort_students
group2.sort_students

puts "Group 1 students:"
group1.students.each { |student| puts "#{student.last_name}, #{student.first_name}" }

puts "\nGroup 2 students:"
group2.students.each { |student| puts "#{student.last_name}, #{student.first_name}" }
