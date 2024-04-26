def weirdcase string
    string.split.map { |word| word.chars.each_with_index.map { |c, i| i.even? ? c.upcase : c.downcase }.join }.join(' ')
 end