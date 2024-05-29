def calculate_points(match_results)
    total_points = 0
  
    match_results.each do |result|
      scores = result.split(":").map(&:to_i)
      x = scores[0]
      y = scores[1]
  
      if x > y
        total_points += 3
      elsif x == y
        total_points += 1
      end
    end
  
    return total_points
  end
  
  # Example usage:
  match_results = ["3:1", "2:2", "0:1", "4:0", "1:0", "2:3", "0:0", "3:2", "4:1", "1:1"]
  puts calculate_points(match_results) # Output: 18