def solution(str)
  str.chars.each_slice(2).map { |pair| pair.join.ljust(2, '_') }
end