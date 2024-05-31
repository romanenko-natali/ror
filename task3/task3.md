def moveZeros(arr)
  non_zero_items = []
  
  zero_count = 0
  
  arr.each do |element|
    if element == 0
      zero_count += 1
    else
      non_zero_items  << element
    end
  end
  
  non_zero_items.concat([0] * zero_count)
  
  non_zero_items 
end