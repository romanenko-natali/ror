# Complete the solution so that it splits the string into pairs 
# of two characters. If the string contains an odd number of characters 
# then it should replace the missing second character of the final pair 
# with an underscore ('_').

def solution(str)
  str.scan(/.{1,2}/).map { |pair| pair.ljust(2, '_') }
end