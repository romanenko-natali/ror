#Написати клас Student (кожен студент визначається іменем, прізвищем, датою народження, номером заліковки).
#При наданні значено цим змінним робити перевірку на валідність. У випадку невалідних значень викидати помилку.
require 'date'
require_relative 'validation'

class Student
  attr_accessor :name, :surname, :birthdate, :student_id

  def initialize(name, surname, birthdate, student_id)
    @name = name
    @surname = surname
    @birthdate = birthdate
    @student_id = student_id
    validate
  end

  def validate
    raise ArgumentError, "Неправильне ім'я" unless Validation.match(/^[A-Za-z'’]+$/, @name)
    raise ArgumentError, "Неправильне прізвище" unless Validation.match(/^[A-Za-z]+$/, @surname)
    raise ArgumentError, "Неправильна дата народження" unless @birthdate.is_a?(Date)
    raise ArgumentError, "Неправильний номер студентського квитка" unless Validation.match(/^\d{8}$/, @student_id)
  end
end
