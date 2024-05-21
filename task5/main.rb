# Створити модуль Validation з двома методами: match(pattern, text), 
# dateInRange(from, to, date). Написати клас Student (кожен студент 
# визначається іменем, прізвищем, датою народження, номером заліковки). 
# При наданні значено цим змінним робити перевірку на валідність. 
# У випадку невалідних значень викидати помилку. Написати клас Group 
# (кожна група визначається назвою та списком студентів цієї групи). 
# Робити перевірку при заданні назви групи (аналогічно до класу Student) 
# В головній програмі створити 5 студентів (спробувати створювати з невалідними значеннями), 
# Створити дві групи, розділити студентів по групах. Пошукати студентів по заліковці, 
# відсортувати студентів групи в алфавітному порядку (спочатку прізвище, потім ім'я)

# main.rb
require_relative 'student'
require_relative 'group'

begin
  student1 = Student.new('Володимир', 'Романюк', '2003-04-15', '123456')
  student2 = Student.new('Назар', 'Лакуста', '2003-10-17', '234567')
  student3 = Student.new('Сергій', 'Дворянніков', '2003-06-27', '345678')
  student4 = Student.new('Максим', 'Марянчук', '2004-01-01', '456789')
  student5 = Student.new('Віктор', 'Павлік', '1960-09-19', '567890')
  
  # Спроба створення студента з невалідними даними
  begin
    student_invalid = Student.new('Inv@lid', 'N@me', '1999-01-01', '000000')
  rescue InvalidDataError => e
    puts e.message
  end

  group1 = Group.new('Group 101')
  group2 = Group.new('Group 102')

  group1.add_student(student1)
  group1.add_student(student2)
  group2.add_student(student4)
  group2.add_student(student3)
  group2.add_student(student5)

  puts "Group 1 students before sorting:"
  group1.students.each { |student| puts "#{student.last_name}, #{student.first_name}" }

  group1.sort_students!
  puts 
  puts "Group 1 students after sorting:"
  group1.students.each { |student| puts "#{student.last_name}, #{student.first_name}" }
    puts 
  puts "Group 2 students before sorting:"
  group2.students.each { |student| puts "#{student.last_name}, #{student.first_name}" }
  puts 
  group2.sort_students!
  puts "Group 2 students after sorting:"
  group2.students.each { |student| puts "#{student.last_name}, #{student.first_name}" }
  
  search_id = '345678'
  found_student = group2.find_student_by_id(search_id)
  if found_student
    puts "Found student with ID #{search_id}: #{found_student.first_name} #{found_student.last_name}"
  else
    puts "No student found with ID #{search_id}"
  end

rescue InvalidDataError => e
  puts e.message
end
