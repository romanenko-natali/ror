def solution(str)
  str += '_' if str.length.odd?
  pairs = str.scan(/../)
  pairs
end