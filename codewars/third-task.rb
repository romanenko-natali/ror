# Write an algorithm that takes an array 
# and moves all of the zeros to the end, 
# preserving the order of the other elements.

def moveZeros(arr) 
   arr.partition { |elem| elem.is_a?(Numeric) && elem.zero? }.then { |zeros, non_zeros| non_zeros + zeros }
end