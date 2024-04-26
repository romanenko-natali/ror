def moveZeros(arr)
    arr.sort_by { |el| el == 0 ? 1 : 0 }
 end