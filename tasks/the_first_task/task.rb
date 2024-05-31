def points(games)
  total_points = 0

  games.each do |game|
    x, y = game.split(':').map(&:to_i)
    
    if x > y
      total_points += 3
    elsif x == y
      total_points += 1
    end
    # if x < y, do nothing as we add 0 points for a loss
  end

  total_points
end
