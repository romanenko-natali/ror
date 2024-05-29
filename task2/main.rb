require_relative 'validation'
require_relative 'student'
require_relative 'group'

begin
  student1 = Student.new("Ivan", "Ivanov", "2000-05-15", "123456")
  student2 = Student.new("Petr", "Petrov", "1999-08-22", "654321")
  student3 = Student.new("Sidor", "Sidorov", "2001-03-30", "112233")
  student4 = Student.new("Anna", "Annovna", "1998-12-01", "223344")
  student5 = Student.new("Elena", "Lenina", "2002-07-17", "334455")

  # Invalid students (закоментовано для прикладу)
  # invalid_student = Student.new("Ivan@", "Ivanov", "2000-05-15", "123456")  # Invalid first name
  # invalid_student = Student.new("Ivan", "Ivanov", "1800-05-15", "123456")  # Invalid birth date
  # invalid_student = Student.new("Ivan", "Ivanov", "2000-05-15", "abc123")  # Invalid student ID

  group1 = Group.new("Group A")
  group2 = Group.new("Group B")

  group1.add_student(student1)
  group1.add_student(student2)
  group1.add_student(student3)

  group2.add_student(student4)
  group2.add_student(student5)

  puts "Students in Group A before sorting:"
  group1.students.each { |student| puts "#{student.last_name} #{student.first_name}" }

  group1.sort_students!

  puts "Students in Group A after sorting:"
  group1.students.each { |student| puts "#{student.last_name} #{student.first_name}" }

  student_found = group1.find_student_by_id("123456")
  puts "Student found by ID 123456: #{student_found.first_name} #{student_found.last_name}" if student_found

rescue => e
  puts e.message
end
