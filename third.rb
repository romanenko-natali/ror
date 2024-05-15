#Write an algorithm that takes an array and moves all of the zeros to the end, preserving the order of the other elements.
#moveZeros [1,2,0,1,0,1,0,3,0,1] #-> [1,2,1,1,3,1,0,0,0,0]

def move_zeros(arr)
  non_zeros = arr.reject { |x| x == 0 }
  zeros = arr.select { |x| x == 0 }
  non_zeros + zeros
end

moveZeros=[1,2,0,1,0,1,0,3,0,1]
puts move_zeros(moveZeros)
