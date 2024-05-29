require_relative 'student'
require_relative 'group'

# Створення студентів
students = []
begin
  students << Student.new("John", "Doe", "1990-05-15", "123456")
  students << Student.new("Jane", "Smith", "1985-03-10", "654321")
  students << Student.new("Alice", "Johnson", "2000-07-22", "112233")
  students << Student.new("Bob", "Brown", "1995-02-17", "223344a")
  students << Student.new("Eve", "Davis", "1988-11-30", "334455")
rescue => e
  puts "Error creating student: #{e.message}"
end

# Створення груп
group1 = Group.new("Group A")
group2 = Group.new("Group B")

# Розподіл студентів по групах
group1.add_student(students[0])
group1.add_student(students[1])
group1.add_student(students[2])

group2.add_student(students[3])
group2.add_student(students[4])

# Пошук студента по заліковці
found_student = group1.find_student_by_id("123456")
puts "Found student: #{found_student.first_name} #{found_student.last_name}" if found_student

# Сортування студентів в групі
sorted_students = group1.sort_students
puts "Sorted students in Group A:"
sorted_students.each { |student| puts "#{student.last_name} #{student.first_name}" }