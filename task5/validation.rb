# validation.rb
require 'date'

module Validation
  NAME_PATTERN = /^[a-zA-Zа-яА-ЯёЁіІїЇєЄ]{2,30}$/
  ID_PATTERN = /^\d{6}$/

  def match(pattern, text)
    !!(text =~ pattern)
  end

  def dateInRange(from, to, date)
    begin
      from_date = Date.parse(from)
      to_date = Date.parse(to)
      target_date = Date.parse(date)
      target_date >= from_date && target_date <= to_date
    rescue ArgumentError
      false
    end
  end

  def validate_name(name)
    match(NAME_PATTERN, name)
  end

  def validate_student_id(student_id)
    match(ID_PATTERN, student_id)
  end

  def validate_birth_date(birth_date, from, to)
    dateInRange(from, to, birth_date)
  end

  def validate_group_name(name)
    match(/^[a-zA-Z0-9 ]{2,50}$/, name)
  end
end
