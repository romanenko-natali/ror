#Написати клас Group (кожна група визначається назвою та списком студентів цієї групи). 
#Робити перевірку при заданні назви групи (аналогічно до класу Student)
class Group
  attr_accessor :name, :students

  def initialize(name)
    @name = name
    @students = []
  end

  def add_student(student)
    @students << student
  end
  
  def validate_name
    raise ArgumentError, "Неправильна назва групи" unless Validation.match(/^[A-Za-z0-9\s'’]+$/, @name)
  end
  
  def sort_students
    @students.sort_by! { |student| [student.surname, student.name] }
  end


end
