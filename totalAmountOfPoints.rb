def points(games)
  total_points = 0
  
  games.each do |game|
    scores = game.split(":").map(&:to_i)
    if scores[0] > scores[1]
      total_points += 3
    elsif scores[0] == scores[1]
      total_points += 1
    end
  end
  
  return total_points
end