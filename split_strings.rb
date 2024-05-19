def solution(str)
  pairs = []
  str.chars.each_slice(2) do |slice|
    pairs << slice.join
  end
  pairs[-1] += "_" if str.length.odd? && !str.empty?
  pairs
end