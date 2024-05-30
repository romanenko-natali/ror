#Write a function that accepts a string, and returns the same string with all even indexed
#characters in each word upper cased, and all odd indexed characters in each word lower cased.
#The indexing just explained is zero based, so the zero-ith index is even,
#therefore that character should be upper cased and you need to start over for each word.
#The passed in string will only consist of alphabetical characters and spaces(' ').
#Spaces will only be present if there are multiple words. Words will be separated by a single space(' ').

def transform_string(input_string)
  result = []
  input_string.split.each do |word|
    transformed_word = ""
    word.chars.each_with_index do |char, i|
      if i.even?
        transformed_word += char.upcase
      else
        transformed_word += char.downcase
      end
    end
    result << transformed_word
  end
  result.join(" ")
end

# Приклади використання
puts transform_string("String")  # Вивід: "StRiNg"
puts transform_string("Weird string case")  # Вивід: "WeIrD StRiNg CaSe"
