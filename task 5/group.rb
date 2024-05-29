class Group
  include Validation

  attr_accessor :name, :students

  def initialize(name)
    self.name = name
    @students = []
  end

  def name=(name)
    Validation.match(/^[A-Za-z0-9\s]+$/, name)
    @name = name
  end

  def add_student(student)
    @students << student
  end

  def find_student_by_id(student_id)
    @students.find { |student| student.student_id == student_id }
  end

  def sort_students
    @students.sort_by { |student| [student.last_name, student.first_name] }
  end
end