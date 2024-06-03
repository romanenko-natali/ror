def manipulate_string(s)
  result = []
  s.split.each do |word|
    manipulated_word = ''
    word.chars.each_with_index do |char, i|
      if i.even?
        manipulated_word += char.upcase
      else
        manipulated_word += char.downcase
      end
    end
    result << manipulated_word
  end
  result.join(' ')
end

# Test cases
puts manipulate_string("something")  # Output: "StRiNg"
puts manipulate_string("Weird string case")  # Output: "WeIrD StRiNg CaSe"
