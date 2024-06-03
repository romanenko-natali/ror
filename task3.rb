def move_zeros(array)
  zeros = array.count(0)  # Count the number of zeros
  array.reject { |x| x == 0 } + [0] * zeros  # Remove zeros and append zeros to the end
end

# Test case
p move_zeros([1,2,0,1,0,1,0,3,0,1])  # Output: [1, 2, 1, 1, 3, 1, 0, 0, 0, 0]
