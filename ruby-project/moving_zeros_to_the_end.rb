def moveZeros(arr) 
  non_zeros = arr.select { |num| num != 0 }
  zeros = arr.count(0)
  result = non_zeros + [0] * zeros
  result
end
