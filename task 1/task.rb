def points(matches)
  total_points = 0

  matches.each do |match|
    x, y = match.split(':').map(&:to_i)

    if x > y
      total_points += 3
    elsif x == y
      total_points += 1
    end
  end

  total_points
end