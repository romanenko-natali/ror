def moveZeros(arr)

  non_zeros = []
  zeros = []


  arr.each do |num|
    if num == 0
      zeros << num
    else
      non_zeros << num
    end
  end


  non_zeros + zeros
end


result = moveZeros([1, 2, 0, 1, 0, 1, 0, 3, 0, 1])
puts result.inspect