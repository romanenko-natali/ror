def solution(str)
  pairs = []
  str += '_' if str.length.odd?
  (0...str.length).step(2) do |i|
    pairs << str[i, 2]
  end
  pairs
end