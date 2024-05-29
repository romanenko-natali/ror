def move_zeros(arr)
  non_zeros = arr.reject { |num| num == 0 }
  zeros_count = arr.count(0)
  non_zeros + [0] * zeros_count
end
