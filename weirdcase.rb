def weirdcase(str)
  words = str.split(' ')
  result = words.map do |word|
    modified_word = ''
    word.chars.each_with_index do |char, index|
      modified_word += index.even? ? char.upcase : char.downcase
    end
    modified_word
  end
  result.join(' ')
end