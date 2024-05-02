def weirdcase input_string
 input_string.split.map do |word|
        word.chars.each_with_index.map do |char, index|
            index.even? ? char.upcase : char.downcase
        end.join
    end.join(' ')
end