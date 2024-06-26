## Task

Our football team has finished the championship.

Our team's match results are recorded in a collection of strings. Each match is represented by a string in the format "x:y", where x is our team's score and y is our opponents score.

For example: ["3:1", "2:2", "0:1", ...]

Points are awarded for each match as follows:
```
if x > y: 3 points (win)
if x < y: 0 points (loss)
if x = y: 1 point (tie)

```
We need to write a function that takes this collection and returns the number of points our team (x) got in the championship by the rules given above.

Notes:

our team always plays 10 matches in the championship
0 <= x <= 4
0 <= y <= 4


## Code
```
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
```
## Tests
```
describe "Total amount of points" do
  it "Basic tests" do 
    Test.assert_equals(points(['1:0','2:0','3:0','4:0','2:1','3:1','4:1','3:2','4:2','4:3']),30)
    Test.assert_equals(points(["1:1","2:2","3:3","4:4","2:2","3:3","4:4","3:3","4:4","4:4"]),10)
    Test.assert_equals(points(["0:1","0:2","0:3","0:4","1:2","1:3","1:4","2:3","2:4","3:4"]),0)
    Test.assert_equals(points(["1:0","2:0","3:0","4:0","2:1","1:3","1:4","2:3","2:4","3:4"]),15)
    Test.assert_equals(points(["1:0","2:0","3:0","4:4","2:2","3:3","1:4","2:3","2:4","3:4"]),12)
  end
end
```
## Screenshots
![Знімок екрана 2024-05-28 о 23 03 11](https://github.com/VadHane/ruby_hanevych/assets/65092760/371b7425-8aa0-490a-b0fa-f02f33fbd97b)

