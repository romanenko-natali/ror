def points(games)
  points = 0
  games.each do |score|
    x, y = score.split(":")
    points += 3 if x > y
    points += 1 if x == y
  end
  
  points
end