# group.rb
require_relative 'validation'
require_relative 'student'

class Group
  attr_reader :name, :students

  def initialize(name)
    @name = validate_name(name)
    @students = []
  end

  def add_student(student)
    @students << student
  end

  def find_student_by_number(student_number)
    @students.find { |student| student.student_number == student_number }
  end

  def sort_students
    @students.sort_by { |student| [student.last_name, student.first_name] }
  end

  private

  def validate_name(name)
    Validation.match(/^[A-Za-z]+$/, name)
    name
  end
end
