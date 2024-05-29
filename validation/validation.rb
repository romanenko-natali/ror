module Validation
  def self.match(pattern, text)
    raise "Invalid format" unless text.match?(pattern)
  end

  def self.date_in_range(from, to, date)
    raise "Date out of range" unless date >= from && date <= to
  end
end