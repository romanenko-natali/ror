# Task 1

def points(match_results)
  total_points = 0
  match_results.each do |result|
    x, y = result.split(":").map(&:to_i)
    total_points += 3 if x > y
    total_points += 1 if x == y
  end
  total_points
end