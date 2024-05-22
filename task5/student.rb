# student.rb
require_relative 'validation'
require 'date'

class InvalidDataError < StandardError; end

class Student
  attr_accessor :first_name, :last_name, :birth_date, :student_id

  DATE_RANGE_START = '2000-01-01'
  DATE_RANGE_END = '2010-12-31'

  def initialize(first_name, last_name, birth_date, student_id)
    @first_name = validate_name(first_name, 'First name')
    @last_name = validate_name(last_name, 'Last name')
    @birth_date = validate_birth_date(birth_date)
    @student_id = validate_student_id(student_id)
  end

  private

  def validate_name(name, field_name)
    raise InvalidDataError, "#{field_name} is invalid" unless Validation.validate_name(name)
    name
  end

  def validate_birth_date(birth_date)
    raise InvalidDataError, "Birth date is invalid" unless Validation.validate_birth_date(birth_date, DATE_RANGE_START, DATE_RANGE_END)
    birth_date
  end

  def validate_student_id(student_id)
    raise InvalidDataError, "Student ID is invalid" unless Validation.validate_student_id(student_id)
    student_id
  end
end
