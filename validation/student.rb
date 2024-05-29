require 'date'
require_relative 'validation'

class Student
  attr_reader :first_name, :last_name, :birthdate, :student_number

  def initialize(first_name, last_name, birthdate, student_number)
    @first_name = validate_name(first_name)
    @last_name = validate_name(last_name)
    @birthdate = validate_birthdate(birthdate)
    @student_number = validate_student_number(student_number)
  end

  private

  def validate_name(name)
    Validation.match(/^[A-Za-z]+$/, name)
    name
  end

  def validate_birthdate(birthdate)
    date = Date.parse(birthdate)
    Validation.date_in_range(Date.new(1900, 1, 1), Date.today, date)
    date
  rescue ArgumentError
    raise "Invalid date format. Please provide date in the format YYYY-MM-DD."
  end

  def validate_student_number(student_number)
    Validation.match(/^\d{6}$/, student_number)
    student_number
  end
end
