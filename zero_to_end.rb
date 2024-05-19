def moveZeros(arr) 
  non_zeros = []
  zero_count = 0
  arr.each do |num|
    if num != 0
      non_zeros << num
    else
      zero_count += 1
    end
  end
  non_zeros + [0] * zero_count
end