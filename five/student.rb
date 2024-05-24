require_relative 'validation'

class Student
  include Validation

  attr_accessor :name, :surname, :birthdate, :student_id

  def initialize(name, surname, birthdate, student_id)
    @name = name
    @surname = surname
    @birthdate = birthdate
    @student_id = student_id
    validate_student(@name, @surname, @birthdate, @student_id)
  end
end
