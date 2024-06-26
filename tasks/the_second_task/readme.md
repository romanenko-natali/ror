## Task

Complete the solution so that it splits the string into pairs of two characters. If the string contains an odd number of characters then it should replace the missing second character of the final pair with an underscore ('_').

Examples:

* 'abc' =>  ['ab', 'c_']
* 'abcdef' => ['ab', 'cd', 'ef']

## Code

```
def solution(str)
  # Add _ in the end, if length is add
  str += '_' if str.length.odd?

  # Split string
  pairs = str.scan(/../)

  pairs
end
```

## Test
```
describe "Split Strings" do
  it "Basic tests" do
    expect(solution("abcdef")).to eq(["ab", "cd", "ef"])
    expect(solution("abcdefg")).to eq(["ab", "cd", "ef", "g_"])
    expect(solution("")).to eq([])
  end
end
```

## Screenshots

![Знімок екрана 2024-05-28 о 23 08 01](https://github.com/VadHane/ruby_hanevych/assets/65092760/40cc165a-b45c-4307-bfda-3e95bbde4286)
