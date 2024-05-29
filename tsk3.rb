def move_zeros(arr)
    non_zeros = arr.select { |num| num != 0 }
    zeros = arr.select { |num| num == 0 }
    non_zeros + zeros
  end
  
  puts move_zeros([1,2,0,1,0,1,0,3,0,1]).inspect
  # Output: [1, 2, 1, 1, 3, 1, 0, 0, 0, 0]