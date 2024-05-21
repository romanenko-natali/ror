# student.rb
require_relative 'validation'
require 'date'

class InvalidDataError < StandardError; end

class Student
  attr_accessor :first_name, :last_name, :birth_date, :student_id

  NAME_PATTERN = /^[a-zA-Zа-яА-ЯёЁіІїЇєЄ]{2,30}$/
  ID_PATTERN = /^\d{6}$/
  DATE_RANGE_START = '1950-01-01'
  DATE_RANGE_END = '2010-12-31'

  def initialize(first_name, last_name, birth_date, student_id)
    @first_name = validate_name(first_name, 'First name')
    @last_name = validate_name(last_name, 'Last name')
    @birth_date = validate_birth_date(birth_date)
    @student_id = validate_student_id(student_id)
  end

  private

  def validate_name(name, field_name)
    raise InvalidDataError, "#{field_name} is invalid" unless Validation.match(NAME_PATTERN, name)
    name
  end

  def validate_birth_date(birth_date)
    raise InvalidDataError, "Birth date is invalid" unless Validation.dateInRange(DATE_RANGE_START, DATE_RANGE_END, birth_date)
    birth_date
  end

  def validate_student_id(student_id)
    raise InvalidDataError, "Student ID is invalid" unless Validation.match(ID_PATTERN, student_id)
    student_id
  end
end
