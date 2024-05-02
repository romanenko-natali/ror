def moveZeros(arr) 
  arr.sort! { |a, b| a == 0 ? 1 : 0 }
end