def points(games)
  total_points = 0

  games.each do |game|
    our_score, their_score = game.split(':').map(&:to_i)
    total_points += case
                    when our_score > their_score then 3
                    when our_score == their_score then 1
                    else 0
                    end
  end

  total_points
end
