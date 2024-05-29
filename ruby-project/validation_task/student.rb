# student.rb

require_relative 'validation'
require 'date'

class Student
  include Validation

  attr_accessor :first_name, :last_name, :birthdate, :student_id

  NAME_PATTERN = /^[A-Z][a-z]+$/
  ID_PATTERN = /^\d{6}$/
  MIN_AGE = 16
  MAX_AGE = 100

  def initialize(first_name, last_name, birthdate, student_id)
    raise "Invalid first name" unless Validation.match(NAME_PATTERN, first_name)
    raise "Invalid last name" unless Validation.match(NAME_PATTERN, last_name)
    raise "Invalid birthdate" unless valid_birthdate?(birthdate)
    raise "Invalid student ID" unless Validation.match(ID_PATTERN, student_id)

    @first_name = first_name
    @last_name = last_name
    @birthdate = birthdate
    @student_id = student_id
  end

  private

  def valid_birthdate?(birthdate)
    return false unless birthdate.is_a?(Date)
    
    today = Date.today
    min_date = today.prev_year(MAX_AGE)
    max_date = today.prev_year(MIN_AGE)
    Validation.date_in_range(min_date, max_date, birthdate)
  end
end
