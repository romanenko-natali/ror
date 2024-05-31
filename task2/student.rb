require 'date'
require_relative 'validation'

class Student
  attr_accessor :first_name, :last_name, :birth_date, :student_id

  NAME_PATTERN = /^[A-Za-zА-Яа-я]+$/
  STUDENT_ID_PATTERN = /^\d{6}$/
  BIRTH_DATE_RANGE = ('1900-01-01'..'2006-12-31')

  def initialize(first_name, last_name, birth_date, student_id)
    @first_name = first_name
    @last_name = last_name
    @birth_date = birth_date
    @student_id = student_id

    validate!
  end

  private

  def validate!
    unless Validation.match(NAME_PATTERN, @first_name)
      raise "Invalid first name: #{@first_name}"
    end

    unless Validation.match(NAME_PATTERN, @last_name)
      raise "Invalid last name: #{@last_name}"
    end

    unless Validation.date_in_range(BIRTH_DATE_RANGE.begin, BIRTH_DATE_RANGE.end, @birth_date)
      raise "Invalid birth date: #{@birth_date}"
    end

    unless Validation.match(STUDENT_ID_PATTERN, @student_id)
      raise "Invalid student ID: #{@student_id}"
    end
  end
end
