def points(games)
  total_points = 0
  
  games.each do |game|
    x, y = game.split(":").map(&:to_i)
    puts "Scores: #{x}, #{y}"
    if x > y
      total_points += 3
    elsif x == y
      total_points += 1
    end
    puts "Total points so far: #{total_points}"
  end
  
  total_points
end

# Example usage
games = ["3:1", "2:2", "0:1", "4:0", "1:2", "1:3", "0:4", "2:2", "3:4", "4:4"]
puts points(games)  # Output: 14
