# validation.rb

module Validation
  def self.match(pattern, text)
    !!(text =~ pattern)
  end

  def self.dateInRange(from, to, date)
    Date.parse(from) <= Date.parse(date) && Date.parse(date) <= Date.parse(to)
  rescue ArgumentError
    false
  end
end
