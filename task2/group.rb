require_relative 'validation'
require_relative 'student'

class Group
  attr_accessor :name, :students

  NAME_PATTERN = /^[A-Za-zА-Яа-я0-9\s]+$/

  def initialize(name, students = [])
    @name = name
    @students = students

    validate!
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

  def validate!
    unless Validation.match(NAME_PATTERN, @name)
      raise "Invalid group name: #{@name}"
    end
  end
end
