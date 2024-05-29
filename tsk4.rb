def alternate_case(string)
    words = string.split
    result = []
    words.each do |word|
      altered_word = ''
      word.chars.each_with_index do |char, i|
        altered_word += i.even? ? char.upcase : char.downcase
      end
      result << altered_word
    end
    result.join(' ')
  end
  
  # Test cases
  puts alternate_case("String")  # Output: "StRiNg"
  puts alternate_case("Weird string case")  # Output: "WeIrD StRiNg CaSe"