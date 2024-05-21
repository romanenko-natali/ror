# validation.rb
module Validation
	def self.match(pattern, text)
	  !!(text =~ pattern)
	end
  
	def self.dateInRange(from, to, date)
	  begin
		from_date = Date.parse(from)
		to_date = Date.parse(to)
		target_date = Date.parse(date)
		target_date >= from_date && target_date <= to_date
	  rescue ArgumentError
		false
	  end
	end
  end
  