require 'date'

class Student
  attr_accessor :first_name, :last_name, :birth_date, :student_id

  def initialize(first_name, last_name, birth_date, student_id)
    @first_name = first_name
    @last_name = last_name
    @birth_date = validate_birth_date(birth_date)
    @student_id = validate_student_id(student_id)
  end

  private

  def validate_birth_date(date_str)
    begin
      date = Date.parse(date_str)
      raise 'Invalid date range' unless Validation.date_in_range(Date.new(1900, 1, 1), Date.today, date)
      date
    rescue ArgumentError
      raise 'Invalid date format'
    end
  end

  def validate_student_id(id)
    raise 'Invalid student ID format' unless Validation.match(/\A\d{6}\z/, id)
    id
  end
end
