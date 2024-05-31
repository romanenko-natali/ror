def moveZeros(arr) 
  zeros = arr.count(0)
  arr.delete(0)
  arr.fill(0, arr.size, zeros)
end
