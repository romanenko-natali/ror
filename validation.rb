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
  attr_reader :name, :surname, :birthdate, :record_book_number

  def initialize(name, surname, birthdate, record_book_number)
    validate_name!(name)
    validate_surname!(surname)
    validate_birthdate!(birthdate)
    validate_record_book_number!(record_book_number)

    @name = name
    @surname = surname
    @birthdate = birthdate
    @record_book_number = record_book_number
  end

  private

  def validate_name!(name)
    raise ArgumentError, "Невірний формат імені: #{name}" unless name =~ /\A[А-Яа-яёЁЇіІ][А-Яа-яёЁЇіІ]*\Z/
  end

  def validate_surname!(surname)
    raise ArgumentError, "Невірний формат прізвища: #{surname}" unless Validation.match(/^[A-Яа-яёЁЇіІ][A-Яа-яёЁЇіІ]*$/, surname)
  end

  def validate_birthdate!(birthdate)
    raise ArgumentError, "Невірний формат дати народження: #{birthdate}" unless birthdate.is_a?(Date)
  end

  def validate_record_book_number!(record_book_number)
    raise ArgumentError, "Невірний формат номера заліковки: #{record_book_number}" unless Validation.match(/\d{6}/, record_book_number)
  end
end

class Group
  attr_reader :name, :students

  def initialize(name)
    validate_group_name!(name)

    @name = name
    @students = []
  end

  def add_student(student)
    @students << student
  end

  private
  
  def validate_group_name!(name)
    raise ArgumentError, "Невірний формат назви групи: #{name}" unless name =~ /\d+/
  end
end

students = []
begin
  students << Student.new("Іван", "Петренко", Date.new(1990, 1, 1), "123456")
  students << Student.new("Петро", "Сидоренко", Date.new(1995, 2, 2), "654321")
  students << Student.new("Олена", "Василенко", Date.new(2000, 3, 3), "789012")
  students << Student.new("Марк", "Іванов", Date.new(2005, 4, 4), "345678")
rescue ArgumentError => e
  puts "Помилка при створенні студента: #{e.message}"
end

group1 = Group.new("401")
group2 = Group.new("402")

group1.add_student(students[0])
group1.add_student(students[1])
group2.add_student(students[2])
group2.add_student(students[3])

# Looking for a student by his record book number
record_book_number = "345678"
student = students.find { |s| s.record_book_number == record_book_number }
puts "Студент з номером заліковки #{record_book_number}: #{student.name} #{student.surname}" if student

# Sorting students from group 1
sorted_students = group1.students.sort_by { |s| [s.surname, s.name] }
puts "Відсортовані студенти групи 1:"
sorted_students.each do |s|
  puts "#{s.name} #{s.surname}"
end
