def weirdcase string
  string.split.map do |str|
    str.chars.each_with_index.map do |char, index|
      index.even? ? char.upcase : char.downcase
    end.join
  end.join(' ')
end