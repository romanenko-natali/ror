# student.rb

require_relative 'validation'
require 'date'

class Student
  attr_reader :first_name, :last_name, :dob, :student_id

  def initialize(first_name, last_name, dob, student_id)
    raise "Invalid first name" unless Validation.match(/^[a-zA-Z]+$/, first_name)
    raise "Invalid last name" unless Validation.match(/^[a-zA-Z]+$/, last_name)
    raise "Invalid date of birth" unless Validation.dateInRange('1900-01-01', '2023-12-31', dob)
    raise "Invalid student ID" unless Validation.match(/^\d{5}$/, student_id)

    @first_name = first_name
    @last_name = last_name
    @dob = dob
    @student_id = student_id
  end

  def to_s
    "#{last_name}, #{first_name} (DOB: #{dob}, ID: #{student_id})"
  end
end
