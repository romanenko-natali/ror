def solution(str)

  str += '_' if str.length.odd?


  pairs = []


  (0...str.length).step(2) do |i|

    pairs << str[i, 2]
  end


  pairs
end


result = solution("abc")
puts result.inspect

result = solution("abcdef")
puts result.inspect

