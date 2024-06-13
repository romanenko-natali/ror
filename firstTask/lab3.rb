def moveZeros(arr)
  non_zeros = arr.select { |num| num != 0 }
  zero_count = arr.count(0)

  non_zeros + [0] * zero_count
end