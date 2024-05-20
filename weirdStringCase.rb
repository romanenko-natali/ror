def weirdcase(str)
  # Split the string into words
  words = str.split
  
  # Transform each word
  transformed_words = words.map do |word|
    word.chars.each_with_index.map do |char, index|
      index.even? ? char.upcase : char.downcase
    end.join
  end
  
  # Join the transformed words back into a single string
  transformed_words.join(' ')
end