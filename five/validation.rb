#Створити модуль Validation з двома методами: match(pattern, text), dateInRange(from, to, date).
module Validation
  def self.match(pattern, text)
    !!text.match(pattern)
  end

  def self.dateInRange(from, to, date)
    from <= date && date <= to
  end
end
