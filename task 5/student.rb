require 'date'
require_relative 'validation'

class Student
  include Validation

  attr_accessor :first_name, :last_name, :birth_date, :student_id

  def initialize(first_name, last_name, birth_date, student_id)
    self.first_name = first_name
    self.last_name = last_name
    self.birth_date = birth_date
    self.student_id = student_id
  end

  def first_name=(name)
    Validation.match(/^[A-Za-z]+$/, name)
    @first_name = name
  end

  def last_name=(name)
    Validation.match(/^[A-Za-z]+$/, name)
    @last_name = name
  end

  def birth_date=(date)
    date_obj = Date.parse(date)
    Validation.dateInRange(Date.new(1980,1,1), Date.today, date_obj)
    @birth_date = date_obj
  end

  def student_id=(id)
    Validation.match(/^\d{6}$/, id)
    @student_id = id
  end
end