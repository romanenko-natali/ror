def solution(str)
  pairs = []
  
  (0...str.length).step(2) do |i|
    if i + 1 < str.length
      pairs << str[i] + str[i + 1]
    else
      pairs << str[i] + '_'
    end
  end
  
  pairs
end
