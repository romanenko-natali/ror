require 'date'

class InvalidDataError < StandardError; end

module Validation
  def self.match(pattern, text)
    !!(text =~ pattern)
  end

  def self.date_in_range?(from, to, date)
    (Date.parse(from)..Date.parse(to)).cover?(Date.parse(date))
  rescue ArgumentError
    false
  end
end

class Student
  attr_accessor :first_name, :last_name, :birth_date, :student_id

  NAME_PATTERN = /^[a-zA-Zа-яА-ЯёЁіІїЇєЄ]{2,30}$/
  ID_PATTERN = /^\d{6}$/
  DATE_RANGE = ('1950-01-01'..'2010-12-31')

  def initialize(first_name, last_name, birth_date, student_id)
    @first_name = validate(first_name, NAME_PATTERN, 'First name')
    @last_name = validate(last_name, NAME_PATTERN, 'Last name')
    @birth_date = validate(birth_date) { |date| Validation.date_in_range?(DATE_RANGE.first, DATE_RANGE.last, date) }
    @student_id = validate(student_id, ID_PATTERN, 'Student ID')
  end

  private

  def validate(value, pattern = nil, field_name = nil)
    raise InvalidDataError, "#{field_name} is invalid" if pattern && !Validation.match(pattern, value)
    raise InvalidDataError, "Date is invalid" if block_given? && !yield(value)
    value
  end
end

class Group
  attr_accessor :name, :students

  NAME_PATTERN = /^[a-zA-Z0-9 ]{2,50}$/

  def initialize(name)
    @name = validate(name, NAME_PATTERN, "Group name")
    @students = []
  end

  def add_student(student)
    @students << student
  end

  def find_student_by_id(student_id)
    @students.find { |student| student.student_id == student_id }
  end

  def sort_students!
    @students.sort_by! { |student| [student.last_name, student.first_name] }
  end

  private

  def validate(value, pattern, field_name)
    raise InvalidDataError, "#{field_name} is invalid" unless Validation.match(pattern, value)
    value
  end
end

begin
  students = [
    Student.new('Володимир', 'Михайлюк', '2003-06-28', '000001'),
    Student.new('Назар', 'Григоряк', '2003-10-17', '000002'),
    Student.new('Віктор', 'Янукович', '1960-09-19', '000003'),
    Student.new('Сергій', 'Притула', '2003-06-27', '000004'),
    Student.new('Максим', 'Максимов', '2004-01-01', '000005'),
    Student.new('Володимир', 'Великий', '2003-06-28', '000006'),
    Student.new('Назарій', 'Яремчук', '2003-10-17', '000007'),
    Student.new('Юлія', 'Тимошенко', '1960-09-19', '000008'),
    Student.new('Сергій', 'Швець', '2003-06-27', '000009')
  ]

  begin
    Student.new('Inv@lid', 'N@me', '1999-01-01', '000000')
  rescue InvalidDataError => e
    puts e.message
  end

  group1 = Group.new('402')
  group2 = Group.new('422')

  students[0..3].each { |student| group1.add_student(student) }
  students[4..8].each { |student| group2.add_student(student) }

  puts "Group 1 students before sorting:"
  group1.students.each { |student| puts "#{student.last_name}, #{student.first_name}" }

  group1.sort_students!
  puts "\nGroup 1 students after sorting:"
  group1.students.each { |student| puts "#{student.last_name}, #{student.first_name}" }

  puts "\nGroup 2 students before sorting:"
  group2.students.each { |student| puts "#{student.last_name}, #{student.first_name}" }

  group2.sort_students!
  puts "\nGroup 2 students after sorting:"
  group2.students.each { |student| puts "#{student.last_name}, #{student.first_name}" }

  search_id = '000007'
  found_student = group2.find_student_by_id(search_id)
  puts found_student ? "Found student with ID #{search_id}: #{found_student.first_name} #{found_student.last_name}" : "No student found with ID #{search_id}"

rescue InvalidDataError => e
  puts e.message
end
