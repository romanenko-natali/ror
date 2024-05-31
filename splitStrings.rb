def solution(str)
  result = []
  str.chars.each_slice(2) do |pair|
    if pair.size == 2
      result << pair.join
    else
      result << pair.join + "_"
    end
  end
  result
end