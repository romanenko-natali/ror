module Validation
  def self.match(pattern, text)
    !!(text =~ pattern)
  end

  def self.date_in_range(from, to, date)
    from_date = Date.parse(from)
    to_date = Date.parse(to)
    date = Date.parse(date)
    (from_date..to_date).cover?(date)
  end
end
