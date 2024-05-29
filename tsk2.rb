def split_into_pairs(str)
    pairs = str.scan(/.{1,2}/)
    pairs[-1] += '_' if pairs[-1].length == 1
    pairs
  end
  
  puts split_into_pairs('abc')   # Output: ['ab', 'c_']
  puts split_into_pairs('abcdef') # Output: ['ab', 'cd', 'ef']