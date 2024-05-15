#Complete the solution so that it splits the string into pairs of two characters. If the string contains an odd number of characters then it should replace the missing second character of the final pair with an underscore ('_').

#Examples:

#* 'abc' =>  ['ab', 'c_']
#* 'abcdef' => ['ab', 'cd', 'ef']

def split_into_pairs(string)
  pairs = string.chars.each_slice(2).map(&:join)  # Розбиваємо рядок на пари
  pairs[-1] += '_' if string.length.odd?
  pairs
end

str = 'abc'
puts split_into_pairs(str)
