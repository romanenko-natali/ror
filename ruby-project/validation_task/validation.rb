# validation.rb

module Validation
  def self.match(pattern, text)
    !!(text =~ pattern)
  end

  def self.date_in_range(from, to, date)
    from <= date && date <= to
  end
end
