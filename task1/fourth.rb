def weirdcase(string)

  words = string.split(" ")

  words.map! do |word|

    characters = word.chars


    characters.each_with_index do |char, index|

      characters[index] = index.even? ? char.upcase : char.downcase
    end


    characters.join
  end


  words.join(" ")
end

puts weirdcase('This')
puts weirdcase('is')
puts weirdcase('This is a test')