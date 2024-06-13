class Group
  attr_accessor :name, :students

  def initialize(name)
    @name = validate_group_name(name)
    @students = []
  end

  def add_student(student)
    @students << student
  end

  def find_student_by_id(student_id)
    @students.find { |student| student.student_id == student_id }
  end

  def sort_students!
    @students.sort_by! { |student| [student.last_name, student.first_name] }
  end

  private

  def validate_group_name(name)
    raise 'Invalid group name format' unless Validation.match(/\A[A-Za-z0-9]+\z/, name)
    name
  end
end
