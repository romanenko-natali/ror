def moveZeros(arr)
  non_zeros = arr.select { |num| num != 0 }
  zeros = arr.count(0)
  non_zeros + [0] * zeros
end