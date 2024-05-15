#Створити модуль Validation з двома методами: match(pattern, text), dateInRange(from, to, date).
#Написати клас Student (кожен студент визначається іменем, прізвищем, датою народження, номером заліковки).
#При наданні значено цим змінним робити перевірку на валідність. У випадку невалідних значень викидати помилку.
#Написати клас Group (кожна група визначається назвою та списком студентів цієї групи). 
#Робити перевірку при заданні назви групи (аналогічно до класу Student)




#В головній програмі створити 5 студентів (спробувати створювати з невалідними значеннями),
#Створити дві групи, розділити студентів по групах. 
#Пошукати студентів по заліковці, 
#відсортувати студентів групи в алфавітному порядку 
#(спочатку прізвище, потім ім'я)

require_relative 'validation'
require_relative 'student'
require_relative 'group'


#Пошукати студентів по заліковці, 
def find_student_by_id_in_groups(groups, student_id)
  groups.each do |group|
    group.students.each do |student|
      return student if student.student_id == student_id
    end
  end
  nil
end


#В головній програмі створити 5 студентів (спробувати створювати з невалідними значеннями),
student1 = Student.new("Ivan", "Ivanov", Date.new(1995, 7, 15), "12345678")
student2 = Student.new("Maria", "Marin", Date.new(1994, 9, 20), "87654321")
student3 = Student.new("Kolya", "Poroshenko", Date.new(1990, 5, 10), "99999999")
student4 = Student.new("Anna", "Illich", Date.new(1993, 3, 25), "77777777")
student5 = Student.new("Miha", "Ylo", Date.new(1992, 11, 5), "55555555")


#Створити дві групи, розділити студентів по групах. 
group1 = Group.new("Group 1")
group2 = Group.new("Group 2")

group1.add_student(student1)
group1.add_student(student2)
group1.add_student(student3)
group2.add_student(student4)
group2.add_student(student5)
group1.add_student(student6)


#відсортувати студентів групи в алфавітному порядку 
group1.sort_students
group2.sort_students

#(спочатку прізвище, потім ім'я)
puts "Students in Group 1:"
group1.students.each { |student| puts "#{student.surname}, #{student.name}" }
puts "\nStudents in Group 2:"
group2.students.each { |student| puts "#{student.surname}, #{student.name}" }

#Пошукати студентів по заліковці, 
student_id_to_find = "12345678"
student_found = find_student_by_id_in_groups([group1, group2], student_id_to_find)
if student_found
  puts "Student found: #{student_found.name} #{student_found.surname}"
else
  puts "Student with ID #{student_id_to_find} not found in any group."
end
