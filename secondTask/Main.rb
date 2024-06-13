require_relative 'Validation'
require_relative 'Student'
require_relative 'Group'

begin
  student1 = Student.new('John', 'Doe', '2001-04-15', '123456')
  student2 = Student.new('Jane', 'Smith', '2000-05-20', '654321')
  student3 = Student.new('Jim', 'Beam', '1999-11-30', '111111')
  student4 = Student.new('Jack', 'Daniels', '2002-12-01', '222222')
  student5 = Student.new('Jill', 'Stark', '2001-07-25', '333333')

  # Спроба створити студента з невалідними значеннями
  # student_invalid = Student.new('Invalid', 'Student', '3000-01-01', '123')

  group1 = Group.new('GroupA')
  group2 = Group.new('GroupB')

  group1.add_student(student1)
  group1.add_student(student2)
  group1.add_student(student3)

  group2.add_student(student4)
  group2.add_student(student5)

  puts "Students in Group1 before sorting:"
  group1.students.each { |student| puts "#{student.last_name}, #{student.first_name}" }

  group1.sort_students!

  puts "Students in Group1 after sorting:"
  group1.students.each { |student| puts "#{student.last_name}, #{student.first_name}" }

  found_student = group1.find_student_by_id('123456')
  puts "Found student: #{found_student.first_name} #{found_student.last_name}" if found_student

rescue => e
  puts "An error occurred: #{ e.message }"
end
