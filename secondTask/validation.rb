module Validation
  def self.match(pattern, text)
    pattern.match?(text)
  end

  def self.date_in_range(from, to, date)
    date.between?(from, to)
  end
end
