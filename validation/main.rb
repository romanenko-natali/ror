require_relative 'student'
require_relative 'group'

begin
  student1 = Student.new("John", "Doe", "2000-05-15", "123456")
  student2 = Student.new("Jane", "Smith", "1999-10-20", "654321")
  student3 = Student.new("Alice", "Brown", "2001-08-22", "112233")
  student4 = Student.new("Bob", "White", "2002-12-13", "445566")
  student5 = Student.new("Charlie", "Black", "2003-07-30", "778899")

  group1 = Group.new("GroupA")
  group2 = Group.new("GroupB")

  group1.add_student(student1)
  group1.add_student(student2)
  group1.add_student(student3)

  group2.add_student(student4)
  group2.add_student(student5)

  puts "Students in Group1:"
  group1.sort_students.each do |student|
    puts "#{student.last_name}, #{student.first_name} - #{student.student_number}"
  end

  puts "\nStudents in Group2:"
  group2.sort_students.each do |student|
    puts "#{student.last_name}, #{student.first_name} - #{student.student_number}"
  end

  student_number = "123456"
  found_student = group1.find_student_by_number(student_number)
  if found_student
    puts "\nStudent found in Group1: #{found_student.first_name} #{found_student.last_name}"
  else
    puts "\nStudent not found in Group1."
  end

rescue => e
  puts "Error: #{e.message}"
end
