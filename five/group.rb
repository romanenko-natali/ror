require_relative 'validation'

class Group
  include Validation

  attr_accessor :name, :students

    def initialize(name)
      @name = name
      @students = []
      Validation.validate_name(@name)
    end


  def add_student(student)
    @students << student
  end
  
  def sort_students
    @students.sort_by! { |student| [student.surname, student.name] }
  end
end
