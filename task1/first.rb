def points(match_results)
  total_points = 0

  match_results.each do |match|
    x, y = match.split(':').map(&:to_i)
    if x > y
      total_points += 3
    elsif x == y
      total_points += 1
    end
  end

  total_points
end


match_results = ["3:1", "2:2", "0:1", "4:0", "1:1", "2:3", "3:2", "0:0", "1:2", "4:4"]
total_points = points(match_results)
puts "Total points earned by our team: #{total_points}"

puts points(['1:0','2:0','3:0','4:0','2:1','3:1','4:1','3:2','4:2','4:3'])
puts points(["1:1","2:2","3:3","4:4","2:2","3:3","4:4","3:3","4:4","4:4"])
puts points(["0:1","0:2","0:3","0:4","1:2","1:3","1:4","2:3","2:4","3:4"])
puts points(["1:0","2:0","3:0","4:0","2:1","1:3","1:4","2:3","2:4","3:4"])
puts points(["1:0","2:0","3:0","4:4","2:2","3:3","1:4","2:3","2:4","3:4"])