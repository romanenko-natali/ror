module Validation
  def validate_name(name)
    raise ArgumentError, "Неправильна назва групи" unless match?(/^[A-Za-z0-9\s'’]+$/, name)
  end

  def validate_student(name, surname, birthdate, student_id)
    raise ArgumentError, "Неправильне ім'я" unless match?(/^[A-Za-z'’]+$/, name)
    raise ArgumentError, "Неправильне прізвище" unless match?(/^[A-Za-z]+$/, surname)
    raise ArgumentError, "Неправильна дата народження" unless birthdate.is_a?(Date)
    raise ArgumentError, "Неправильний номер студентського квитка" unless match?(/^\d{8}$/, student_id)
  end

  def match?(pattern, text)
    !!text.match(pattern)
  end

  def date_in_range?(from, to, date)
    from <= date && date <= to
  end
end
