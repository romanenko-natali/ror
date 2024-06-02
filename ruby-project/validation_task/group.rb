# group.rb

require_relative 'validation'
require_relative 'student'

class Group
  attr_reader :name, :students

  def initialize(name)
    raise "Invalid group name" unless Validation.match(/^[a-zA-Z\s]+$/, name)
    @name = name
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
end
