# group.rb
require_relative 'validation'
require_relative 'student'

class Group
  attr_accessor :name, :students

  NAME_PATTERN = /^[a-zA-Z0-9 ]{2,50}$/

  def initialize(name)
    @name = validate_name(name)
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

  def validate_name(name)
    raise InvalidDataError, "Group name is invalid" unless Validation.match(NAME_PATTERN, name)
    name
  end
end