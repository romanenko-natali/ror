## Task

Write an algorithm that takes an array and moves all of the zeros to the end, preserving the order of the other elements.
```
moveZeros [1,2,0,1,0,1,0,3,0,1] #-> [1,2,1,1,3,1,0,0,0,0]
```

## Code

```
def moveZeros(arr) 
  non_zero_elements = arr.select { |num| num != 0 }

  zero_count = arr.count(0)

  result = non_zero_elements + [0] * zero_count
  result
end
```

## Test

```
describe "Random" do
  it "test" do
    expect(moveZeros([1,2,0,1,0,1,0,3,0,1])).to eq( [ 1, 2, 1, 1, 3, 1, 0, 0, 0, 0 ])
  end
end
```

## Screenshots
![Знімок екрана 2024-05-28 о 23 14 47](https://github.com/VadHane/ruby_hanevych/assets/65092760/d178c905-b8ad-4e68-b040-3e658a54a818)
