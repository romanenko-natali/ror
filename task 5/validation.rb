module Validation
  def self.match(pattern, text)
    raise "Invalid format" unless text =~ pattern
  end

  def self.dateInRange(from, to, date)
    raise "Date out of range" unless (from..to).cover?(date)
  end
end